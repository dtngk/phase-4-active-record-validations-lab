class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbaity

    CLICK_BAIT_REGEX_PATTERNS = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]

    def clickbaity 
        if CLICK_BAIT_REGEX_PATTERNS.none? { |p| p.match title}
            errors.add(:title, "ClickBait Title")
        end
    end
end
