require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:tag_articles)
  should have_many(:tags).through(:tag_articles)
end
