class Interview < ApplicationRecord

  belongs_to :position
  belongs_to :candidate
  has_many :interview_questions
  has_many :interview_participants
  has_many :questions, through: :interview_questions
  has_many :interviewers, through: :interview_participants

  scope :upcoming, -> do
    where(['interview_date > ?', Time.now])
    .order(interview_date: :asc)
    .limit(2)
  end
end
