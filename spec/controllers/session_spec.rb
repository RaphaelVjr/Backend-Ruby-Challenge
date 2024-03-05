require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    render_views

  let(:user) { User.create!(email: 'test@example.com', password: 'password') }

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
      expect(JSON.parse(response.body)["status"]).to eq('ok')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new session" do
        post :create, params: { email: user.email, password: 'password' }
        expect(session[:user_id]).to eq(user.id)
        expect(JSON.parse(response.body)["status"]).to eq('ok')
      end
    end

    context "with invalid params" do
      it "does not create a new session" do
        post :create, params: { email: user.email, password: 'wrong_password' }
        expect(session[:user_id]).to be_nil
        expect(JSON.parse(response.body)["status"]).to eq('error')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested session" do
      post :create, params: { email: user.email, password: 'password' }
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(JSON.parse(response.body)["status"]).to eq('ok')
    end
  end
end
