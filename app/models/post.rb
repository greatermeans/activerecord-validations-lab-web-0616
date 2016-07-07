class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :clickbait, inclusion: { in: [true]}
	validates :category, inclusion: {in: %w{Fiction Non-Fiction}}

	def clickbait
		["Won't Believe", "Secret", "Top", "Guess"].any? { |w| title =~ /#{w}/ }
	end

end
