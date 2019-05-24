class AdministrationController < ApplicationController
  def index
    if( not can? :Manage, Event)
      redirect_to root_path, notice: "User doesn't have the required privilages"
    end
  end
end
