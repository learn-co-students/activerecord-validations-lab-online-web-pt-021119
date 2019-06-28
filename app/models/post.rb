class Post < ActiveRecord::Base

	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
	# validate :title, not_clickbait: true

	# def not_clickbait
	# 	unless record.title.include?("Won't Believe") || record.include?("Secret") || record.include?("Top [number]") || record.include?("Guess")
	# 		errors.add(:title, "not clickbait-y enough, dude")
	# 	end
	# end

end
