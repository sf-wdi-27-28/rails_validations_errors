class Owner < ActiveRecord::Base
  # TODO: add validations
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /[^@\s]+@[^@\s]+/ }
  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
    if !self.phone.nil?
      self.phone = self.phone.gsub(/\)|\(|-|\.|,/,"")
      self.phone = self.phone.gsub(/1\d{10}/,self.phone[1..self.phone.length])
    end
  end

end
