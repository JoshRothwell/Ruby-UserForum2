require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without a title" do
    article = Article.new(body: "Lorem ipsum")
    assert_not article.save, "Saved the article without a title"
  end
  
  test "should save article with a unique title" do
    article = Article.new(title: "New Article", body: "Lorem ipsum")
    assert article.save, "Failed to save the article with a unique title"
  end
  
  # Add more test methods as needed
  
end
