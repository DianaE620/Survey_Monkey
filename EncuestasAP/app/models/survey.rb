class Survey < ActiveRecord::Base

  validates :name, uniqueness: true
  
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :participations
  has_many :survey_takers, through: :participations, source: :user
  has_many :responses, through: :participations

end
