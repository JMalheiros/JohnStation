require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @article = articles(:one)
  end

  test "visiting the root page" do
    visit root_url
    assert_selector "h1", text: "Articles"

    assert_text "Article 1"
    assert_no_text "Article 2"
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end
end
