require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(
  		name: "Example User",
  		email: "user@example.com")
  end

  test "should be valid"  do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "      "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "      "
  	assert_not @user.valid?
  end

  test "name should be short" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "email should be short" do
  	@user.email = "a" * 256
  	assert_not @user.valid?
  end

  test "email format valid" do
  	valid_address = %w[user@example.com
  						alice+bob@baz.cn]
  	valid_address.each do |address|
  		@user.email = address
  		assert (@user.valid?, 
  			"#{address.inspect} should be valid")
  	end
  end

  test "email format invalid" do
  	valid_address = %w[user@example,com
  						alice+bobatbaz.cn]
  	valid_address.each do |address|
  		@user.email = address
  		assert_not (@user.valid?, 
  			"#{address.inspect} should not be valid")
  	end
  end
end
