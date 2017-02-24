require 'rails_helper'

RSpec.describe Book, :type => :model do
  subject { described_class.new(title: "Anything",
                                isbn: "Any") }

  describe "Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without isbn" do
        subject.isbn = nil
        expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "HABTM authors" do
      assc = described_class.reflect_on_association(:authors)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end
end
