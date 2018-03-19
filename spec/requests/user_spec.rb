require 'rails_helper'

RSpec.describe "sign in", :type => :request do
  it "displays the user homepage after successful login" do
    user = User.new_user(:email => "jdoe", :password => "secret", :confirm_password => "secret")

    post "/login", :params => {:signin => {:email => "jdoe", :password => "secret"}}
    expect(response).to redirect_to '/hovedside'
  end
end