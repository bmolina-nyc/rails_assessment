class PassportsController < ApplicationController


  def new 
    @passport = Passport.new
  end

  def create
    user = current_user
    @passport = Passport.new(passport_params)
  
    if @passport.creation_valid?.empty? 
       @passport.save
       flash[:notice] = "Passport Obtained"
       redirect_to user_path(user)
    else
       flash[:notice] = "#{@passport.creation_valid?.join(" ")}"
       redirect_to new_user_passport_path(user)
    end
  end

  def edit 
    @passport = Passport.find_by(id: params[:id])
  end

  def update 
    if current_user.passport.params_valid?(passport_params)
      current_user.passport.update(passport_params)

      flash[:notice] = "Passport Info Updated"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Your Full Name and Home State must match"
      redirect_to edit_user_passport_path(current_user, current_user.passport)
    end
  end

  private 

  def passport_params
    params.require(:passport).permit(:full_name, :state, :user_id)
  end
end
