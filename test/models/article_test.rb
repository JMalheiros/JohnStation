require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  should belong_to(:user)
end
