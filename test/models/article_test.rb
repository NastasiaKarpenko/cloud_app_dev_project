require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    article = Article.new(title: "Sample Title", body: "Sample Body", published: true)
    assert article.valid?
  end

  test "should not be valid without a title" do
    article = Article.new(body: "Sample Body", published: true)
    assert_not article.valid?
    assert_equal ["can't be blank"], article.errors[:title]
  end

  test "should not be valid without a body" do
    article = Article.new(title: "Sample Title", published: true)
    assert_not article.valid?
    assert_equal ["can't be blank"], article.errors[:body]
  end

  test "should not be valid with a title shorter than 5 symbols" do
    article = Article.new(title: "Short", body: "Sample Body", published: true)
    assert_not article.valid?
    assert_equal ["Title should be longer than 5 symbols!"], article.errors[:title]
  end

  test "should not be valid with a title longer than 100 symbols" do
    article = Article.new(title: "A" * 101, body: "Sample Body", published: true)
    assert_not article.valid?
    assert_equal ["Make title shorter!"], article.errors[:title]
  end

  test "should have published attribute as true or false" do
    article = Article.new(title: "Sample Title", body: "Sample Body", published: nil)
    assert_not article.valid?
    assert_equal ["is not included in the list"], article.errors[:published]
  end
end