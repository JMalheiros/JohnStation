require "test_helper"

class TagArticleTest < ActiveSupport::TestCase
  should belong_to(:tag)
  should belong_to(:article)
end
