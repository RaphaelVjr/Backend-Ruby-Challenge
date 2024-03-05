require 'rails_helper'

RSpec.describe "Routes", type: :routing do
  it "routes /login to the sessions controller" do
    expect(get("/login")).to route_to("sessions#new")
  end

  it "routes /logout to the sessions controller" do
    expect(delete("/logout")).to route_to("sessions#destroy")
  end

  it "routes /users to the users controller" do
    expect(get("/users")).to route_to("users#index")
    expect(post("/users")).to route_to("users#create")
  end

  it "routes /movies to the movies controller" do
    expect(get("/movies")).to route_to("movies#index", format: 'json')
    expect(post("/movies")).to route_to("movies#create", format: 'json')
  end

  it "routes /user_movies to the user_movies controller" do
    expect(post("/user_movies"))  .to route_to("user_movies#create")
    expect(put("/user_movies/1")).to route_to("user_movies#update", id: "1")
  end
end