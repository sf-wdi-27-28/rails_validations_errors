class Owner < ActiveRecord::Base
  has_many :pets
  validates :first_name, presence: true, length: { maximum: 255}, uniqueness: { case_sensitive: true }
  validates :last_name, presence: true, length: { maximum: 255}, uniqueness: { case_sensitive: true }
  validates :email, presence: true, length: { maximum: 255}, uniqueness: { case_sensitive: true }, format: { with: /@/ }

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
