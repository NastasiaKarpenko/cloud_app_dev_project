require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      article = Article.new(title: 'Valid Title', body: 'Valid content.', published: true)
      expect(article).to be_valid
    end

    it 'is not valid without a title' do
      article = Article.new(body: 'Valid content.', published: true)
      expect(article).to_not be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'is not valid with a short title' do
      article = Article.new(title: 'short', body: 'Valid content.', published: true)
      expect(article).to_not be_valid
      expect(article.errors[:title]).to include("Title should be longer than 5 symbols!")
    end

    it 'is not valid with a long title' do
      article = Article.new(title: 'a' * 101, body: 'Valid content.', published: true)
      expect(article).to_not be_valid
      expect(article.errors[:title]).to include("Make title shorter!")
    end

    it 'is not valid without a body' do
      article = Article.new(title: 'Valid Title', published: true)
      expect(article).to_not be_valid
      expect(article.errors[:body]).to include("can't be blank")
    end

    it 'is not valid with an undefined published state' do
      article = Article.new(title: 'Valid Title', body: 'Valid content.', published: nil)
      expect(article).to_not be_valid
      expect(article.errors[:published]).to include("is not included in the list")
    end
  end
end
