require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should create a valid user" do
    user = User.create(
      first_name: "Andy",
      last_name: "Farquharson",
      email: "andy@andy.com",
      password: "123",
      password_confirmation: "123"
      )
      expect(user).to be_valid
    end

    it "should have a password and password_confirmation" do
    user = User.create(
      first_name: "Andy",
      last_name: "Farquharson",
      email: "andy@andy.com",
      password: "123",
      password_confirmation: nil
      )
      expect(user).to_not be_valid
    end

    it "should have a unique email that is not case sensitive" do
      @user = User.create(
        first_name: "Andy",
        last_name: "Farquharson",
        email: "andy@andy.com",
        password_digest: "123",
        )
      @user2 = User.create(
        first_name: "Andy",
        last_name: "Farquharson",
        email: "ANDY@andy.com",
        password_digest: "123",
        )
        expect(@user2).to_not be_valid 
    end
    
    it "should have a matching password and password confirmation" do
      user = User.create(
        first_name: "Andy",
        last_name: "Farquharson",
        email: "andy@andy.com",
        password: "123",
        password_confirmation: "124"
        )
        expect(user).to_not be_valid
    end
    
    it "should have a first name to valid" do
      user = User.create(
        first_name: nil,
        last_name: "Farquharson",
        email: "andy@andy.com",
        password: "123",
        password_confirmation: "124"
        )
      expect(user).to_not be_valid
    end

    it "should have last name to be valid" do
    user = User.create(
      first_name: "Andy",
      last_name: nil,
      email: "andy@andy.com",
      password: "123",
      password_confirmation: "124"
      )
      expect(user).to_not be_valid
    end

    it "should have a password with a minimum of 3 characters" do
      user = User.create(
        first_name: "Andy",
        last_name: "Farquharson",
        email: "andy@andy.com",
        password: "12",
        password_confirmation: "12"
        )
      expect(user).to_not be_valid
    end
  end

  describe 'should .authenticate_with_credentials' do
    it "should authenticate if email and password are valid" do
      user = User.new(
        first_name: "Andy",
        last_name: "Farquharson",
        email: "andy@email.com",
        password: "123",
        password_confirmation: "123"
        )
        authenticate = User.authenticate_with_credentials(user.email, user.password)
    end
  end
end
