class Owner < ActiveRecord::Base
  has_many :pets
  # TODO: add validations
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness:true, presence:true, length: {maximum: 255},
   format: { with: /@/}


  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch

  end

end
