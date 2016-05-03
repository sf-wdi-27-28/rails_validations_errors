class Pet < ActiveRecord::Base
  belongs_to :owner

  validate :name, presence:true, length: {maximum: 255}
  validates :breed, presence: true

  validate :date_of_birth_cannot_be_in_the_future

  # adds an error if birth date is in the future
def date_of_birth_cannot_be_in_the_future
  if date_of_birth.present? && date_of_birth > Date.today
    errors.add(:date_of_birth, "cannot be in the future")
  end
end

def age
  if date_of_birth.nil?
   nil
  else
   now = DateTime.now.to_date
   (now - date_of_birth)/365.0
  end
end

end
