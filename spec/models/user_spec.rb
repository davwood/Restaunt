require 'spec_helper'

describe User do

  before { @user = User.new(first_name: "Bob",
              last_name: "Job", 
  						email: "user@example.com", 
  						password: "foobar", 
  						password_confirmation: "foobar") }

  #subject makes the user the default subject of the test example
  subject { @user }

#without subject we would have written this.
# it "should respond to 'name'" do
#   expect(@user).to respond_to(:name)
# end
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  
  #we could have the confirmation logic in the controller but it's conventional
  #to have active record enforce it also.
  it { should respond_to(:password_confirmation) }

  #this is @user.valid?
  it { should be_valid }

  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
	  before { @user.password_confirmation = "mismatch" }
	  it { should_not be_valid }
  end
end