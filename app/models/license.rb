class License < ActiveRecord::Base
  has_many :state_ids
  has_many :users, through: :state_ids

  def validate_params
    errors = []
    user = User.find(self[:user_id])
    errors << "You must Choose a state of Residence and Create a profile to obtain an ID!" unless profile_and_state
    return errors if !profile_and_state
    errors << "Your homestate must match the state ID you are registering for!" if !homestate_match  
    errors << "You already have this states License!" if already_have_license?
    errors << "Your Signature must match your profile name!" if !name_matches
    errors 
  end

  def profile_and_state
    user = User.find(self[:user_id])
    return false unless user.current_state && user.profile
    true
  end

  def homestate_match  # you can't get a state ID unless you are living in that state currently and the profile state matches
    user = User.find(self[:user_id])
    (user.current_state == self.state_id && user.current_state == user.profile.state) ? true : false 
  end

  def name_matches
    user = User.find(self[:user_id])
    user.profile.name.strip == self.full_name.strip ? true : false 
  end

  def already_have_license?
    user = User.find(self[:user_id])
    user.licenses.any? { |license| license.state_id == self.state_id }
  end

end
