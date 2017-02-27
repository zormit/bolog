class Author < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 3 }
  has_and_belongs_to_many :books
end
