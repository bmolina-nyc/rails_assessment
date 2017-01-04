class StateId < ActiveRecord::Base
  belongs_to :user
  belongs_to :license

  def user_data
    "#{State.find(self.state_id).name} - #{User.find(self.user_id).profile.name}"
  end

end
