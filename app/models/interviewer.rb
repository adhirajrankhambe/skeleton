class Interviewer < ApplicationRecord
  has_many :answer_ratings
  has_many :interview_participants
  has_many :interviews, through: :interview_participants

  def upcoming_interviews
    interviews.upcoming
  end

  def as_json options={}
    super(only: [],
            include: {
                      upcoming_interviews: {
                        only: [:interview_date, :description],
                        include: {
                          candidate: {
                            only: [:name, :email, :phone]
                          },
                          questions: {
                            only: [:question]
                          }
                        }
                      }
            }
          )
  end

end
