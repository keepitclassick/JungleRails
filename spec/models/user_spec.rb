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

    it "is not valid when email isn't unique (case insensitive)" do
      user = User.create(first_name: "Test", last_name: "Person", email: "same@gmail.com", password: "secret", password_confirmation: "secret")
      same_user = User.create(first_name: "Test", last_name: "Person", email: "SAME@gmail.com", password: "secret", password_confirmation: "secret")

      expect(same_user).to_not be_valid
      expect(same_user.errors.full_messages).to include ("Email has already been taken")
    end

    it "is not valid without first name" do
      user = User.create( 
        last_name: "wick", 
        email: "justwickit@example.com", 
        password: "secret", 
        password_confirmation: "secret"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("First name can't be blank")
    end

    it "is not valid without last name" do
      user = User.create( 
        first_name: "John", 
        email: "justwickit@example.com", 
        password: "secret", 
        password_confirmation: "secret"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Last name can't be blank")
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Email can't be blank")
    end

    it "is not valid without pasword" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password can't be blank")
    end

    it "is not valid without pasword confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password confirmation can't be blank")
    end

    it "is not valid when password is shorter than 5 characters" do
      subject.password = "abcd"
      subject.password_confirmation = "abcd"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password is too short (minimum is 5 characters)")
    end

    it "is valid when password is exactly 5 characters" do

      user = User.create( 
        first_name: "John", 
        last_name: "Wick",
        email: "justwickit@example.com", 
        password: "secre", 
        password_confirmation: "secre"
      )
    
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end

  end
end
