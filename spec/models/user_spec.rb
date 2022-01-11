require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      @user = User.create(
        :fname => 'someguy',
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
      expect(@user).to be_valid
    end
    it 'should be invalid when password and password confirmation are not the same' do
      @user = User.create(
        :fname => 'someguy',
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknowss'
        )
      expect(@user).to_not be_valid
    end
    it 'user2 should be invalid when it has the same email as user1' do
      @user1 = User.create(
        :fname => 'someguy',
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
       @user2 = User.create(
        :fname => 'someguy111',
        :lname => 'youdontknow111',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        ) 
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
    end
    it 'should be invalid if user2 email is the same email but in different cases' do
      @user1 = User.create(
        :fname => 'someguy',
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
       @user2 = User.create(
        :fname => 'someguy111',
        :lname => 'youdontknow111',
        :email => 'SOMEGUYYOUDONTKNOW@EMAIL.COM',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        ) 
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
    end
    it 'user should be invalid if fname is missing' do
      @user = User.create(
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
      expect(@user).to_not be_valid
    end
    it 'user should be invalid if lname is missing' do
      @user = User.create(
        :fname => "someguy",
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
      expect(@user).to_not be_valid
    end
    it 'user should be invalid if email is missing' do
      @user = User.create(
        :fname => "someguy",
        :lname => 'youdontknow',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
      expect(@user).to_not be_valid
    end
    it 'should show correct error if passowrd length is less than 10 characters' do
      @user = User.create(
        :fname => "someguy",
        :lname => 'youdontknow',
        :password => 'you',
        :password_confirmation => 'you'
        )
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 10 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should be able to log in with a newly created user' do
      @user = User.create(
        :fname => 'someguy',
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
      loginUser = User.authenticate_with_credentials('someguyyoudontknow@email.com', 'youdontknow')
      expect(loginUser.email).to eq @user.email
    end
    it 'should be able to authenticate successfully with spaces in email' do
      @user = User.create(
        :fname => 'someguy',
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
      loginUser = User.authenticate_with_credentials('  someguyyoudontknow@email.com  ', 'youdontknow')
      expect(loginUser.email).to eq @user.email
    end
    it 'should be able to authenticate successfully even with weird cases for email' do
      @user = User.create(
        :fname => 'someguy',
        :lname => 'youdontknow',
        :email => 'someguyyoudontknow@email.com',
        :password => 'youdontknow',
        :password_confirmation => 'youdontknow'
        )
      loginUser = User.authenticate_with_credentials('SOMeguyyouDOntknow@EMail.com', 'youdontknow')
      expect(loginUser.email).to eq @user.email
    end
  end
end
