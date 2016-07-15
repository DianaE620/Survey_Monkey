class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :participation
  belongs_to :option
end
