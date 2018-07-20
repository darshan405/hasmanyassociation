  require 'rails_helper'

  describe AnswersController do
    let(:question) {FactoryGirl.create(:question, text: "samplequestion")}
    let(:answer1) {FactoryGirl.create(:answer, body: "first answer", question_id: question.id)}
     let!(:answer) { FactoryGirl.create(:answer, body: "delete", question_id: question.id)}
    describe 'create' do
      context 'positve case' do
        it 'create the answers' do
          answers_params = {body: "i am here"}
          expect{
            post :create, :question_id => question.id, :answer => answers_params  
            }.to change(Answer, :count).by 1
            expect(response).to redirect_to(question_path(question))
          end
        end
      end
      describe 'create' do
        context 'negative case' do
          it 'create the answers' do
            answers_params = {body: ""}
            expect{
              post :create, :question_id => question.id, :answer => answers_params  
              }.to change(Answer, :count).by 0
              expect(response).to redirect_to(question_path(question))
            end
          end
        end
        describe 'destroy' do
          context 'positve case' do
            it 'delete the answer' do
              @question = FactoryGirl.create(:question, text: "samplequestion")
              answer = FactoryGirl.create(:answer, body: "delete", question_id: @question.id)
              expect{delete :destroy, id: answer.id, question_id: @question.id}.
              to change{@question.answers.count}.by(-1)
              binding.pry
              expect(response).to redirect_to(question_path(answer))
            end                                                                         
          end                                                                         
        end
      end
