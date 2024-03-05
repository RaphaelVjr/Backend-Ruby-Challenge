require 'rails_helper'
require 'devise'

RSpec.describe MoviesController, type: :controller do
  include Devise::Test::ControllerHelpers
  render_views

  let(:valid_attributes) {
    { id: 1, title: 'Test Movie', director: 'Test Director', average_score: 8.5, created_at: '2024-02-29', updated_at: '2024-05-03' }
  }

  let(:invalid_attributes) {
    { id: nil, title: nil, director: nil, average_score: nil, created_at: nil, updated_at: nil }
  }

  before do
    user = User.create!(email: 'test@example.com', password: 'password')
    session[:user_id] = user.id
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
  context "with invalid params" do
    it "does not create a new Movie" do
      expect {
        post :create, params: { movie: invalid_attributes }
      }.not_to change(Movie, :count)
    end

    it "renders the 'new' template" do
      post :create, params: { movie: invalid_attributes }
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end
end
end