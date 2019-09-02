class Customer < ApplicationRecord
  validates :name, :phone_number, presence: true

  def blacklisted?
    self.blacklist == true
  end
end
