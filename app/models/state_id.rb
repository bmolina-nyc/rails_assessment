class StateId < ActiveRecord::Base
  belongs_to :user
  belongs_to :license

  before_create :validate_params



  def validate_params
    errors = []
    user = User.find(self[:user_id])
    errors << "You must Choose a state of Residence and Create a profile to obtain an ID!" unless profile_and_state
    return errors if !profile_and_state
    errors << "Your homestate must match the state ID you are registering for!" if !homestate_match  
    errors << "You already have this states ID!" if already_have_state_id?
    errors << "Your Signature must match your profile name!" if !name_matches
    errors 
  end

  def profile_and_state
    user = User.find(self[:user_id])
    return false unless user.current_state && user.profile
    user.profile && user.current_state ? true : false 
  end

  def homestate_match  # you can't get a state ID unless you are living in that state currently
    user.current_state == self.state_id  ? true : false 
  end

  def name_matches
    user.profile.name.strip == self.full_name.strip ? true : false 
  end

  def already_have_state_id?
    user = User.find(self[:user_id])
    user.state_ids.any? { |state| state.state_id == self.state_id }
  end

end
