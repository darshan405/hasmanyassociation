require 'rails_helper'

describe QuestionsController do
  let(:question) {FactoryGirl.create(:question, text: "samplequestion")}
  let(:question2) {FactoryGirl.create(:question, text: "dsfdfdsfdsf")}
  let(:answer1) {FactoryGirl.create(:answer, body: "first answer", question_id: question.id)}
  describe 'index' do
    context 'positive case' do
      it "list all questions" do
        question
        question2
        get :index
        expect(assigns(:questions).count).to eq(2)
      end
    end
  end
  describe 'new' do
    context 'positive case' do
      it 'assigns a new question' do
        get :new
        expect(assigns(:question)).to be_a_new(Question)
      end
    end
  end
  describe "POST create" do
    context 'positive case' do
      it "create question" do 
        question_params = {text: "Create"}
        expect{
          post :create, :id=> question.id, :question=> question_params  
          }.to change(Question, :count).by 2
          expect(get: questions_path).to route_to(controller: "questions", action: "index")
        end
      end
    end
    describe "POST create" do
      context 'negative case' do
        it "create empty question" do
          question_params = {text: nil}
          expect{
            post :create, :id=> question.id, :question=> question_params  
            }.to change(Question, :count).by 1
            expect(get: questions_path).to route_to(controller: "questions", action: "index")
          end
        end
      end
      describe 'edit' do
        context 'positive case' do
          it "edit question" do
            get :edit, :id => question.id
            binding.pry
            expect(assigns(:question)).to eq(question)
          end
        end
      end
      describe 'update' do
        context 'positive case' do
          it "update question" do
            question_params = { text: "prakash"}
            put :update, id: question.id, question: question_params
            expect(assigns(:question).text).to eq('prakash')
          end
        end
      end
      describe 'update' do
        context 'negative case' do
          it "update empty question" do
            question_params = { text: nil}
            put :update, id: question.id, question: question_params
            expect(assigns(:question).text).to eq('')
          end
        end
      end
      describe 'DELETE destroy' do
        context "positive case" do
          it "delete the question" do
            @question = FactoryGirl.create(:question)
            expect{ delete :destroy, :id => @question}.to change(Question, :count).by(-1)
            expect(get: questions_path).to route_to(controller: "questions", action: "index")
          end
        end
      end
    end
