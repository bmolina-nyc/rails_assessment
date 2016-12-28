class PassportsController < ApplicationController

  def new 
    @passport = Passport.new
  end

  def create
    raise params.inspect
    # need to ensure users current state matches state chosen in collection select
    # need to create the users passport and add it to his data - has one passport
    # do not want to allow a user to create a passport if he already has one
    # to meet the learn requirement for nested attributes - can you create a new
    #  user here on the spot?
  end
end
