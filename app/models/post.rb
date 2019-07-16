class TitleValidator < ActiveModel::Validator

  def validate(post)
    if post.title
      post.errors.add(:title, "not clickbaity enough") unless post.title.include?("Won't Believe") || post.title.include?("Secret") || post.title.include?("Guess") || post.title.match?(/(Top)\s(\d)+/)
    else
      post.errors.add(:title, "no title present")
    end
  end
  # validates :title
end

class Post < ActiveRecord::Base

  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  include ActiveModel::Validations
  validates_with TitleValidator

end


# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.
# Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should return false.
