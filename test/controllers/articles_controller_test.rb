require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @article = articles(:one)
    @article2 = articles(:two)
  end

  test "should get index" do
    get articles_url
    assert_response :success
    assert_match @article.title, @response.body
    assert_no_match @article2.title, @response.body
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end
end
