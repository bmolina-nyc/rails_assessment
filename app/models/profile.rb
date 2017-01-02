class Profile < ActiveRecord::Base
  belongs_to :user 
  has_many :addresses
  before_create :profile_valid?

  def addresses_attributes=(addresses_attributes)
    addresses_attributes.each do |i, address_attributes|
      record =  self.addresses.find { |address| address.address_type == address_attributes[:address_type] }
        if record
          record.update(address_attributes)
        else
          self.addresses.build(address_attributes)
        end
    end
  end

  def profile_valid?
    return false if !(self[:name].present? && self[:state].present?)
    self.addresses.each do |address|
      if address.address_type.present?
        return false if !address.street_address.present?  
      end
    end
  end

  def params_valid?(profile_params)
    return false if !profile_params[:name].present? || !profile_params[:state].present?
      profile_params[:addresses_attributes].each do |i, addr_attr|
        if addr_attr[:address_type].present?
          return false if !addr_attr[:street_address].present?  
        end 
      end
    true 
  end

end