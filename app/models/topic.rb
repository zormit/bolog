class Topic < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 1 }
  belongs_to :category
  has_many :books
end
