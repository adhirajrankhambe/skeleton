require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  def setup
    create_answers_and_ratings
  end

  test "candidates average_rating for an answer" do
    candidate = candidates(:fred_flintstone)
    answer_ratings = candidate.answer_ratings.map(&:rating).reject{|r| r == 0}
    sum = answer_ratings.inject(&:+)
    average = (sum.to_f / answer_ratings.size)
    assert candidate.average_rating == average.round(2)
  end
end
