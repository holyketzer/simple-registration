require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:login].any?
		assert user.errors[:password].any?
		assert user.errors[:email].any?
  end

  test "user should have unique login" do
  	user = User.new(login: users(:one).login)

  	assert user.invalid?
  	assert_equal ["has already been taken"], user.errors[:login]
  end

  test "login should not be too short" do
  	user = User.new(login: "123")

  	assert user.invalid?
  	assert_equal ["is too short (minimum is 5 characters)"], user.errors[:login]
  end

  test "login should not be too long" do
		user = User.new(login: "Navuchodonoser-x1234567890-with-very-long-postfix")

  	assert user.invalid?
  	assert_equal ["is too long (maximum is 32 characters)"], user.errors[:login]
  end

  test "email should not be invalid" do
  	invalid_emails = ["wrong@com", "not a email", "ttt.ru", "like an@email.com"]

		invalid_emails.each do |email|
  		user = User.new(email: email)

  		assert user.invalid?
  		assert_equal ["is invalid"], user.errors[:email]
  	end
  end
end
