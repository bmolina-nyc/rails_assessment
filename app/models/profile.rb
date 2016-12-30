class Profile < ActiveRecord::Base
  belongs_to :user 
  has_many :addresses

  def addresses_attributes=(addresses_attributes)
    addresses_attributes.each do |i, address_attributes|
      self.addresses.build(address_attributes)
    end
  end

end

# t.string   "street_address_1"
#     t.string   "street_address_2"
#     t.string   "city"
#     t.string   "state"
#     t.string   "zipcode"
#     t.string   "address_type"