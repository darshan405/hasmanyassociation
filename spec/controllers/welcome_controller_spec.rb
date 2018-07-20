require 'rails_helper'

describe WelcomeController do
let(:user){FactoryGirl.create(:user, name: "sample")}

  describe "GET index" do
    # it "assigns @teams" do
    #   get :index
    #   expect(assigns(:user)).to eq(user)
    # end

    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end
  end
end