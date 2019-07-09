require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :is_click_baity?

  CLICK_BAIT = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i ]

  def is_click_baity?
    #binding.pry
    if CLICK_BAIT.none? { |click_bait_words| click_bait_words.match(title) }
      errors.add(:title, "must be clickbait")
    end
  end

end
