class Owner < ActiveRecord::Base
  has_many :pets
  # TODO: add validations

  validates :first_name, :last_name,
            presence: true,
            uniqueness: true,
            length: { maximum: 255 }
  validates :email,
            presence: true,
            uniqueness: true,
            length: {maximum: 255},
            format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
