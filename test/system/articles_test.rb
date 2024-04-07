require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @article = articles(:one)
  end

  test "visiting the root page" do
    visit root_url
    assert_selector "h1", text: "Articles"
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "should not create article" do
    visit articles_url
    click_on "New article"

    assert_text "HTTP Basic: Access denied."
  end

  test "should not update Article" do
    visit article_url(@article)
    click_on "Edit this article"

    assert_text "HTTP Basic: Access denied."
  end
end
