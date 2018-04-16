class Candidate < ApplicationRecord
  has_many :interviews
  has_many :positions, through: :interviews
  has_many :questions, through: :interviews
  has_many :answers

  has_many :answer_ratings, through: :answers

  def average_rating
    answer_ratings.where.not(rating: 0).average(:rating).round(2)
  end
end
