class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_one :passport
  has_many :states
  has_many :state_ids
  has_many :licenses, through: :state_ids


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

  # current state lived in
  def home_state 
    State.find_by(id: current_state).name
  end

  # all states lived in - don't show current state in the history
  def history
    (self.states.collect { |state| state.name } - [home_state]).join(", ")
  end

  #validation for a passport
  def passport_creation_valid?(params)
    current_state.present? && params[:state].to_i == params[:user_id].to_i
  end

end
