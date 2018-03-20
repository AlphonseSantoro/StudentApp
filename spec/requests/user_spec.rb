require 'rails_helper'

RSpec.describe "sign in and out", type: :request do
  before :each do
    User.new_user(email: "jdoe", password: "secret", confirm_password: "secret")
  end

  it "displays the user homepage after successful login" do
    post "/login", params: { signin: {email: "jdoe", password: "secret"}}
    expect(response).to redirect_to '/hovedside'
  end
  
  it "displays the login if the user is not signed in" do
    get '/hovedside'
    expect(response).to redirect_to '/login'
  end

end