require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    render_views

  let(:valid_attributes) {
    { username: 'testuser', email: 'test@example.com', password: 'password', password_confirmation: 'password' }
  }

  let(:invalid_attributes) {
    { username: '', email: '', password: '', password_confirmation: '' }
  }

  describe "GET #index" do
    it "returns a success response if user exists" do
      user = User.create! valid_attributes
      get :index, params: { email: user.email }
      expect(response).to have_http_status(:ok)
    end

    it "returns a not found response if user does not exist" do
      get :index, params: { email: 'nonexistent@example.com' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end
end