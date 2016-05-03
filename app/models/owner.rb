class Owner < ActiveRecord::Base
  has_many :pets, dependent: :destroy

  validates :first_name,
    presence: true,
    length: {maximum:255}
  validates :last_name,
    presence: true,
    length: {maximum:255}
  validates :email,
    presence: true,
    format: {with: /[@]/},
    uniqueness: true,
    length: {maximum:255}

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
