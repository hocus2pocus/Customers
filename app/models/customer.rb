class Customer < ApplicationRecord
  validates :name, :phone_number, presence: true

  def blacklisted?
    self.blacklist == true
  end

  def self.search(search)
    if search
      Customer.find_by(phone_number: search)
    end
  end
end
