class Passport < ActiveRecord::Base
  belongs_to :user
  has_many :addresses

  before_create :creation_valid?



  def creation_valid?
    errors = []
    errors << "You must Choose a state of Residence and Create a profile to obtain an ID!" unless profile_and_state_present?
    return errors if !profile_and_state_present?
    errors << "Your Home State must match your current state of Residence" if !state_matches
    errors << "Your Signature must match your profile name!" if !name_matches
    errors 
  end

  def profile_and_state_present?
    user.profile.present? && user.current_state.present? ? true : false 
  end

  def state_matches
    (user.current_state == self.state && user.current_state == user.profile.state) ? true : false 
  end

  def name_matches
    user.profile.name.strip == self.full_name.strip ? true : false 
  end

  def params_valid?(passport_params)
    (user.profile.name == passport_params[:full_name]) && (user.current_state == passport_params[:state].to_i) && (user.profile.state == user.current_state)
  end

end
