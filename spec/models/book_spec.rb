require 'rails_helper'

RSpec.describe Book, :type => :model do
  subject { described_class.new(title: "Anything",
                                author: "Anyone",
                                isbn: "Any") }

  describe "Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without an author" do
        subject.author = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without isbn" do
        subject.isbn = nil
        expect(subject).to_not be_valid
    end
  end
end
