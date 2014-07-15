require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "that a user requires an email and password" do
    user = User.new

    assert !user.save, "The user was saved without email and password"

    # puts "--Errors--"
    # user.errors.full_messages.each { |msg| puts msg }
  end

  test "that a user have a unique email" do
    user = User.new
    user.email = users(:one).email

    assert !user.save, "The user was saved with an repeated email"
  end

  test "that a user requires a name" do
    user = User.new
    user.email = "juan.perez@gmail.com"
    user.password = "12345678"

    assert !user.save, "The user was saved without name"
  end

  test "that a user requires a profile name" do
    user = User.new
    user.email = "juan.perez@gmail.com"
    user.password = "12345678"
    user.name = "Juan Perez"

    assert !user.save, "The user was saved without profile name"
  end

  test "that a user profile name have at least 4 letters" do
    user = User.new
    user.email = "juan.perez@gmail.com"
    user.password = "12345678"
    user.name = "Juan Perez"
    user.profile = "abc"

    assert !user.save, "The user was saved with a profile name with less 4 characters"
  end

  test "that a user have profile name maximum 16 letters" do
    user = User.new
    user.email = "juan.perez@gmail.com"
    user.password = "12345678"
    user.name = "Juan Perez"
    user.profile = "themostlargerprofileintheworldz"

    assert !user.save, "The user was saved with a profile name than more 16 characters"
  end

  test "that a user have a correct profile format" do
    user = User.new
    user.email = "juan.perez@gmail.com"
    user.password = "12345678"
    user.name = "Juan Perez"
    user.profile = "juan perez"

    assert !user.save, "The user was saved with a incorrect profile format"
  end
end
