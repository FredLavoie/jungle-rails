require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }  
  end

  it "should create an error if the password and confirmation don't match" do
    testUser = User.create(
      first_name:"Bob",
      last_name:"McBob",
      email:"bob@gmail.com",
      password:"12345678",
      password_confirmation:"123456789"
    )
    expect(testUser).to_not be_valid
  end

  it "should create an error if the email is not unique" do
    testUser1 = User.create(
      first_name:"Bob",
      last_name:"Bobert",
      email:"bob@GMAIL.com",
      password:"77777777",
      password_confirmation:"77777777"
    )
    testUser2 = User.create(
      first_name:"Rob",
      last_name:"McBob",
      email:"BOB@gmail.com",
      password:"88888888",
      password_confirmation:"88888888"
    )
    expect(testUser2).to_not be_valid
  end

  it "should create an error if the password is too short" do
    testUser = User.create(
      first_name:"Bob",
      last_name:"McBob",
      email:"bob@gmail.com",
      password:"123",
      password_confirmation:"123"
    )
    expect(testUser).to_not be_valid
  end

  it "authenticate_with_credentials" do
    user = User.create(
      first_name:"Bob",
      last_name:"McBob",
      email:"bob100@gmail.com",
      password:"1234abcde",
      password_confirmation:"1234abcde"
    )
    validatedUser = User.authenticate_with_credentials(' bob100@gmail.com   ', '1234abcde')
    expect(user).to eq(validatedUser)
  end


end
