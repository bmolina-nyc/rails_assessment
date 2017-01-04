class LicensesController < ApplicationController

  def new
    @license = License.new
  end

  def index
    @licences = License.all
  end

  def create

    user = current_user
    @license = License.new(license_params)

    if @license.validate_params.empty?
      @license.save
      StateId.create(user_id: user.id, state_id: license_params[:state_id], license_id: @license.id)
      flash[:notice] = "New License Obtained"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "#{@license.validate_params.join(" ")}"
      redirect_to new_license_path
    end
  end

  private 

  def license_params
    params.require(:license).permit(:state_id, :id, :user_id, :full_name)
  end

end
