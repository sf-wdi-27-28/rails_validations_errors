class Owner < ActiveRecord::Base
  # TODO: add validations
  has_many :pets, dependent: :destroy

  before_save :normalize_phone_number

  validates :first_name,
            presence: true,
            length: {maximum: 255}

  validates :last_name,
            presence: true,
            length: {maximum: 255}

  validates :email,
            presence: true,
            uniqueness: true,
            length: {maximum: 255},
            format: {with: /[@]/, message: "invalid email"}



  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
    if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[()-.]/,"")
    end
  end

end
