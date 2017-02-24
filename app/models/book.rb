class Book < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :isbn, presence: true,
                   length: { minimum: 1 }
  has_and_belongs_to_many :authors
end
