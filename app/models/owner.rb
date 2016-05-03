class Owner < ActiveRecord::Base
  validates :first_name, :last_name, :email, length:{maximum:255}, presence:true
  validates :email, format: {with: /@/, message: "valid email sucka"}, uniqueness:true

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
