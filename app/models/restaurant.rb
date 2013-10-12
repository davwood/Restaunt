class Restaurant < ActiveRecord::Base
	has_many :reviews

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true

	def average_review
		review_scores = self.reviews.map {|review| review.score}
    	average_review = review_scores.inject {|sum,x| sum + x} / review_scores.length.to_f
		return average_review
	end

end
