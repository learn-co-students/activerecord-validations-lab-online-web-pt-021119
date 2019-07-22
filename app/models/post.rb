class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    @@cbait = [/Won't Believe/, /Secret/, /Top\d+/, /Guess/]

    def clickbait 
        if !@@cbait.any? {|c| c.match title}
            errors.add(:title, "Not quite there")
        end 
    end 
end
