require 'rails_helper'

RSpec.describe Answer, type: :model do

let(:question1){FactoryGirl.create(:question, text: "samplequestion")}
let(:answer2){FactoryGirl.create(:answer, body: "sampleanswer", question: question1)}
  subject {
    answer2
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end
  describe "association" do 
    context "belongs_to association" do 
      it "valid case should have one association" do 
        t = Answer.reflect_on_association(:question)
        expect(t.macro).to eq(:belongs_to)
      end
    end
  end
end
