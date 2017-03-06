class Category < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 1 }
  has_many :topics
end
