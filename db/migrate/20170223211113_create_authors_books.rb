class CreateAuthorsBooks < ActiveRecord::Migration[5.0]
  def change
    change_table :books do |t|
      t.remove :author
    end

    create_join_table :authors, :books do |t|
      t.references :author, foreign_key: true
      t.references :book, foreign_key: true
    end
  end
end
