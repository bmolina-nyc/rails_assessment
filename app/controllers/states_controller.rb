class StatesController < ApplicationController

  def index
    @states = State.all
  end

  # localhost:3000/states/#id
  def show 
    @state = State.find_by(id: params[:id])
  end
end
