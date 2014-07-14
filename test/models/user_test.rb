require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the user requires an email and password" do
    user = User.new
     assert !user.save, "The user was saved without email and password"

     #puts "--Errors--"
     #user.errors.full_messages.each { |msg| puts msg }
   end

   test "the user haev a unique email" do
     user = User.new
     user.email = users(:one).email

      assert !user.save, "The user was saved with an repeated email"

    end

    test "the user requires a name" do
      user = User.new
      user.email = "pablo@gmail.com"
      user.password = "123456789"

       assert !user.save, "The user was saved without a name"

     end
end
