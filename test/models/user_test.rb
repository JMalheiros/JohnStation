require "test_helper"

class UserTest < ActiveSupport::TestCase
  should have_secure_password
  should validate_presence_of(:username)
  should validate_uniqueness_of(:username)
  should have_many(:articles)
end
