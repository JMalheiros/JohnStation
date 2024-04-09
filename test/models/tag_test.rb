require "test_helper"

class TagTest < ActiveSupport::TestCase
  should have_many(:tag_articles)
  should have_many(:articles).through(:tag_articles)
end
