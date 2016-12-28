class License < ActiveRecord::Base
  has_many :state_ids
  has_many :users, through: :state_ids
end
