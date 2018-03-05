require 'rails_helper'

RSpec.describe User, type: :model do
  before :example do
    @user_1 = User.create({ first_name: 'new', last_name: 'usey', email: 'hey@hi.com', password: 'password', password_confirmation: 'password' })
    @user_2 = User.create({ first_name: 'hi', last_name: 'there', email: 'heyyyy@hi.com', password: 'hithere', password_confirmation: 'hithere' })
  end

  after :example do
    User.destroy_all
  end

  describe 'Validations' do
    it "password and password_confirmation must be the same" do
      @user_1.password_confirmation = @user_1.password
      expect(@user_1.valid?).to eq true
      @user_1.password_confirmation = 'pants pants pants; this is not a real password'
      expect(@user_1.valid?).to eq false
    end
    it "should complain when lacking a password" do
      expect(@user_1.valid?).to eq true
      @user_1.password = nil
      expect(@user_1.valid?).to eq false
    end
    it "should complain when lacking a password_confirmation" do
      @user_1.password_confirmation = nil
      expect(@user_1.valid?).to eq false
    end
    it "is invalid if email is not unique" do
      @user_2.email = @user_1.email
      expect(@user_2.valid?).to eq false
    end
    it "is invalid without email" do
      @user_1.email = nil
      expect(@user_1.valid?).to eq false
    end
    it "is invalid without first_name" do
      @user_1.first_name = nil
      expect(@user_1.valid?).to eq false
    end
    it "is invalid without last_name" do
      @user_1.last_name = nil
      expect(@user_1.valid?).to eq false
    end
    it "is invalid if password is less than 6 characters" do
      expect(@user_1.valid?).to eq true
      @user_1.password = 'hey'
      @user_1.password_confirmation = 'hey'
      expect(@user_1.valid?).to eq false
    end
  end

  describe '.authenticate_with_credentials' do
    it "throws error if user is not authenticated with credentials" do
      authenticate = User.authenticate_with_credentials('heyyyy@hi.com', 'hithere')
      expect(authenticate).to_not eq(nil)
    end
    it "allows users to authenticate when email is entered with spaces on either side" do
      authenticate = User.authenticate_with_credentials('   heyyyy@hi.com  ', 'hithere')
      expect(authenticate).to_not eq(nil)
    end
    it "allows users to authenticate when email is entered with upper or lowercase" do
      authenticate = User.authenticate_with_credentials('HeYyYy@hi.com', 'hithere')
      expect(authenticate).to_not eq(nil)
    end
  end

end
