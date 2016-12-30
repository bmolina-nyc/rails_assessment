class Profile < ActiveRecord::Base
  belongs_to :user 
  has_many :addresses

  def addresses_attributes=(addresses_attributes)
    addresses_attributes.each do |i, address_attributes|
      State.find_or_create_by(name: address_attributes[:state]) unless false 
      record =  self.addresses.find { |address| address.address_type == address_attributes[:address_type] }
        if record
          record.update(address_attributes)
        else
          self.addresses.build(address_attributes)
        end
    end
  end

end
    
