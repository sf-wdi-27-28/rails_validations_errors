class Owner < ActiveRecord::Base
  # TODO: add validations

  before_save :normalize_phone_number
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
  validates :email, uniqueness: true
  validates :email, format: { with: /[@]/,
    message: "invalid email" }

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
