class Owner < ActiveRecord::Base
  # TODO: add validations
  has_many :pets

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255}
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: true }, format: { with: /[@]/, message: "must include @ character" }

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
