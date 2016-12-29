class Passport < ActiveRecord::Base
  belongs_to :user

  def valid_entry? 
    first_name.present? && last_name.present?
  end
end
