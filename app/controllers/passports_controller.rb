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
      flash[:notice] = "Cannot Create - State residency must match and all fields must be filled out"
      redirect_to new_user_passport_path(user)
    end
    # need to create the users passport and add it to his data - has one passport
    # do not want to allow a user to create a passport if he already has one

    # can craete two validations here - one to ensure can't double a passport
    #- one to ensure states match up with the collection select

    # to meet the learn requirement for nested attributes - can you create a new
    #  user here on the spot?

  end

  def edit 
    @passport = Passport.find_by(id: params[:id])
  end

  def update 
    user = current_user
    if user.passport_creation_valid?(passport_params)
      user.passport.update(passport_params)

      flash[:notice] = "Passport Info Updated"
      redirect_to user_path(user)
    else
      flash[:notice] = "Cannot Update - State residency must match and all fields must be filled out"
      redirect_to edit_user_passport_path(user, user.passport)
    end
  end

  private 

  def passport_params
    params.require(:passport).permit(:first_name, :last_name, :state, :user_id)
  end
end
