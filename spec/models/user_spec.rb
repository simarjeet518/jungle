require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      User.new(first_name: "simar", last_name: "kk", email: "simar123@gmail.com", password: "key123", password_confirmation: "key123")
    }
    context "creating a new user" do
      it "should be valid if all fields filled" do
        expect(subject).to be_valid
      end

      it "should not be valid if password and password_confirmation does not match" do
        subject.password_confirmation = "lockagain"
        expect(subject).to_not be_valid
      end

      it "should not be valid if email is not provided" do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it "should not be valid if first_name is not provided" do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end

      it "should not be valid if last_name is not provided" do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end

      it "should not be valid if password length is not between 6-40" do
        subject.password = "key1"
        subject.password_confirmation = "key1"
        expect(subject).to_not be_valid
      end

      context "creating a new user with exsiting email" do
        before { User.create!(first_name: "simar", last_name: "kk", email: "simar123@gmail.com", password: "key123", password_confirmation: "key123") }
        it "should not be valid if email is not unique" do
          expect(subject).to_not be_valid
        end
      end
    end
  end
  
  describe '.authenticate_with_credentials' do
    before { User.create!(first_name: "simar", last_name: "kk", email: "simar123@gmail.com", password: "key123", password_confirmation: "key123") }
   
    context "login" do
      it "should be user" do
        user = User.authenticate_with_credentials('simar123@gmail.com', "key123")
        expect(user.email).to eq('simar123@gmail.com')
        expect(user.first_name).to eq('simar')
        expect(user.last_name).to eq('kk')
      end

      it "should not be able to login" do
        user = User.authenticate_with_credentials('123@email.com', "key123")
        expect(user).to eq(nil)
      end

      it "should be valid with edge case: space before/after email" do
        user = User.authenticate_with_credentials(' simar123@gmail.com ', "key123")
        expect(user.email).to eq('simar123@gmail.com')
      end

      it "should be valid with edge case: email case sensitive == false" do
        user = User.authenticate_with_credentials('SImAR123@gmail.coM', "key123")
        expect(user.email).to eq('simar123@gmail.com')
      end
     end

 end
end
