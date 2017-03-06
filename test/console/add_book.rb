def add_book_test
  author1 = Author.new(name: "Jim")
  author2 = Author.new(name: "Greg")
  category = Category.new(name: "cat not the animal")
  topic = Topic.new(name: "top not the best", category: category)
  book = Book.new(title: "gabba", isbn: '123', authors:[author1, author2],
                  topic: topic)

  book.save
  # some quick tests if things are connected:
  book.topic.name == topic.name
  topic.category.name == category.name
  book.category.name == category.name

  return book
end

add_book_test
