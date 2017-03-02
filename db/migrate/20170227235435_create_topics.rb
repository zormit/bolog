class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.references :category, foreign_key: true

      t.timestamps
    end

    add_reference :books, :topics, foreign_key: true
  end
end
