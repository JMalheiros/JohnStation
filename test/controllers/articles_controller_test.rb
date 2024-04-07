require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @article = articles(:one)
  end

  class NotLoggedIn < ArticlesControllerTest
    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should not get new" do
      get new_article_url
      assert_response :unauthorized
    end

    test "should show article" do
      get article_url(@article)
      assert_response :success
    end

    test "should not get edit" do
      get edit_article_url(@article)
      assert_response :unauthorized
    end

    test "should destroy article" do
      assert_difference("Article.count", 0) do
        delete article_url(@article)
      end

      assert_response :unauthorized
    end
  end

  class LoggedIn < ArticlesControllerTest
    def authenticate
      ActionController::HttpAuthentication::Basic.encode_credentials(users(:one).username, users(:one).password)
    end

    test "should get index" do
      get articles_url, headers: { "HTTP_AUTHORIZATION" => authenticate }
      assert_response :success
    end

    test "should get new" do
      get new_article_url, headers: { "HTTP_AUTHORIZATION" => authenticate }
      assert_response :success
    end

    test "should create article when params are right" do
      assert_difference("Article.count") do
        post articles_url,
          headers: { "HTTP_AUTHORIZATION" => authenticate },
          params: { article: {
            title: @article.title,
            subtitle: @article.subtitle,
            content: @article.content,
            user_id: @user.id
          } }
      end

      assert_redirected_to article_url(Article.last)
    end

    test "should show article" do
      get article_url(@article), headers: { "HTTP_AUTHORIZATION" => authenticate }
      assert_response :success
    end

    test "should get edit" do
      get edit_article_url(@article), headers: { "HTTP_AUTHORIZATION" => authenticate }
      assert_response :success
    end

    test "should update article when params are right" do
      patch article_url(@article),
        headers: { "HTTP_AUTHORIZATION" => authenticate },
        params: { article: {
          title: "new title",
          subtitle: "new subtitle",
          content: "new content"
        } }

      assert_equal Article.find(@article.id).title, "new title"
      assert_equal Article.find(@article.id).subtitle, "new subtitle"
      assert_equal Article.find(@article.id).content, "new content"

      assert_redirected_to article_url(@article)
    end

    test "should destroy article" do
      assert_difference("Article.count", -1) do
        delete article_url(@article), headers: { "HTTP_AUTHORIZATION" => authenticate }
      end

      assert_redirected_to articles_url
    end
  end
end
