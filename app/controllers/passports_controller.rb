class PassportsController < ApplicationController


  def new 
    @passport = Passport.new
  end

  def create
    user = current_user

    if user.passport_creation_valid?(passport_params)
      user.passport = Passport.create(passport_params)

      flash[:notice] = "Passport Obtained"
      redirect_to user_path(user)
    else
      flash[:notice] = "Cannot Create"
      redirect_to new_user_passport_path(user)
    end
    # need to create the users passport and add it to his data - has one passport
    # do not want to allow a user to create a passport if he already has one

    # can craete two validations here - one to ensure can't double a passport
    #- one to ensure states match up with the collection select

    # to meet the learn requirement for nested attributes - can you create a new
    #  user here on the spot?

  end


  private 

  def passport_params
    params.require(:passport).permit(:first_name, :last_name, :state, :user_id)
  end
end
