class Article < ApplicationRecord
  validates :title, presence: true, length: {  
    minimum: 5, maximum: 100, 
    too_short: "Title should be longer than 5 symbols!", 
    too_long: "Make title shorter!"  }
  validates :body, presence: true
  validates :published, inclusion: { in: [true, false] }
end
