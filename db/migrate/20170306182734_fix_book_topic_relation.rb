class FixBookTopicRelation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :books, :topics, foreign_key: true
    add_reference :books, :topic, foreign_key: true
  end
end
