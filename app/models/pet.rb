class Pet < ActiveRecord::Base
belongs_to :owner

validates :name,
  presence: true,
  length: {maximum:255}
validates :breed,
  presence: true,
  uniqueness: false, ## delete this if u want to run seed file
  length: {maximum:255} ## delete if u want to run seed file


  validate :date_of_birth_cannot_be_in_the_future

  # adds an error if birth date is in the future
  def date_of_birth_cannot_be_in_the_future
    # stretch
  end

  # calculates age of pet in years
  def age
    # stretch
  end

end
