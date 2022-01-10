require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it "is valid with valid attributes" do
      user = User.new(first_name: "John", last_name: "Wick", email: "justwickit@example.com", password: "continental", password_confirmation: "continental")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end

    it "is not valid when password and password_confirmation don't match" do
      user = User.new(first_name: "John", last_name: "Wick", email: "justwickit@example.com", password: "continental", password_confirmation: "excomm")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

  end
end
