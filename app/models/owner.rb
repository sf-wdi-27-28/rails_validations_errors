class Owner < ActiveRecord::Base
  has_many :pets
  
  # TODO: add validations
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :first_name, :last_name, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true, presence: true, format: { with: EMAIL_FORMAT }, length: {maximum: 255, minimum: 8}
  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number

    # stretch
  end

end
