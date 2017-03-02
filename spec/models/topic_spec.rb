require 'rails_helper'

RSpec.describe Topic, type: :model do
  subject { described_class.new(name: "Anything",
                                category: Category.new(name: "cat")) }

  describe "Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
        subject.category = nil
        expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many books" do
      assc = described_class.reflect_on_association(:books)
      expect(assc.macro).to eq :has_many
    end
  end
end
