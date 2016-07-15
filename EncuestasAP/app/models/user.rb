
class User < ActiveRecord::Base
  # Remember to create a migration!

  #Encuensta que el usuario crea
  has_many :authored_surveys, class_name: "Survey"
  has_many :participations
  #Encuesta que el usuario responde
  has_many :taken_surveys, through: :participations, source: :survey
  has_many :responses, through: :participations
  has_many :options, through: :responses

  include BCrypt

  validates :name, :email, presence: true
  validates :email, uniqueness: true


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
      if user && (user.password == user_password)
        return user
      else
        nil
      end
  end

end
