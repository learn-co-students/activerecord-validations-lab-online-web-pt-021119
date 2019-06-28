class Post::ClickBaitValidator < ActiveModel::Validator
	def validate(record)
		unless record.title.include?("Won't Believe") || record.include?("Secret") || record.include?("Top [number]") || record.include?("Guess")
			record.errors[:title] << "not clickbait-y enough, dude"
		end
	end
end