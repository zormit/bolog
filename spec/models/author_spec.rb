require 'rails_helper'

RSpec.describe Author, :type => :model do
  subject { described_class.new(name: "Any Name") }

  describe "Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a title" do
        subject.name = nil
        expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "HABTM books" do
      assc = described_class.reflect_on_association(:books)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end
end
