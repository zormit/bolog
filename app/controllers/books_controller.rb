# inspired by https://rbudiharso.wordpress.com/2010/07/07/dynamically-add-and-remove-input-field-in-rails-without-javascript/
class BooksController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret",
                               except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.authors.build
    @book.build_topic
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    puts("BOOKPARAMS")
    puts(book_params)
    @book = Book.new(book_params)

    if params[:add_author]
      # add empty author associated with @book
      @book.authors.build
    elsif params[:remove_author]
      # nested models that have _destroy attribute = 1 automatically deleted by rails
    else
      # save goes like usual
      if @book.save
        redirect_to @book and return
      end
    end
    render 'new'
  end

  def update
    @book = Book.find(params[:id])

    author_attributes = params[:book][:authors_attributes] # needed in the first two cases

    if params[:add_author]
      # rebuild the author attributes that doesn't have an id
      unless author_attributes.blank?
        author_attributes.each_value do |attribute|
          @book.authors.build(attribute.except(:_destroy)) unless attribute.key?(:id)
        end
      end
      # add one more empty author attribute
      @book.authors.build
    elsif params[:remove_author]
      # collect all marked for delete author ids
      removed_authors = []
      author_attributes.each_value do |attribute|
        removed_authors << attribute[:id] if (attribute[:id] && attribute[:_destroy].to_i == 1)
      end
      # physically delete these authors from database
      Author.delete(removed_authors)
      author_attributes.each_value do |attribute|
        # rebuild authors attributes that doesn't have an id and its _destroy attribute is not 1
        @book.authors.build(attribute.except(:_destroy)) if (!attribute.key?(:id) && attribute[:_destroy].to_i == 0)
      end
    else
      if @book.update(book_params)
        redirect_to @book and return
      end
    end
    render 'edit'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :isbn, topic: [:name], authors_attributes: [:id, :name, :_destroy])
    end
end
