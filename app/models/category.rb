class Category < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 1 }
  has_many :topics
  has_many :books, through: :topics
end
