class Book < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :isbn, presence: true,
                   length: { minimum: 1 }
  has_and_belongs_to_many :authors
  belongs_to :topic
  delegate :category, to: :topic
  accepts_nested_attributes_for :authors, allow_destroy: true,
    reject_if: lambda {|authors| authors['name'].blank?}
end
