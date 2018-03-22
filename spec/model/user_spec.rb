require 'rails_helper'

RSpec.describe User, type: :model do

    it "create a new valid user" do
        user = User.new_user(email: "jdoe", password: "secret", confirm_password: "secret")
        expect(user).to be_valid
    end

    it "create a new not valid user" do
        user = User.new_user(email:"jdoe", password:"secret", confirm_password: "notsecret")
        expect(user).to_not be_valid
    end

    it "validate password" do
        result = User.validate_password("test", "test")
        expect(result).to be_truthy
    end

end