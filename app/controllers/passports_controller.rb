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
