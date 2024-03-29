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
end