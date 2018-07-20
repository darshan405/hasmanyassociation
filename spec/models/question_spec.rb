require 'rails_helper'

RSpec.describe Question, type: :model do
  subject {
    described_class.new(text: "Anything")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a text" do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
