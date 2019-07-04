class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  @@c_arr = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]

  def clickbait
    errors.add(:title, "Your title is not clickbait-y enough.") if !@@c_arr.any? {|r| r.match title}
  end
end
