class CartController < ApplicationController
  def index
    @user_tickets = UserTicket.where(user_id: current_user.id, paid: false)
  end
end
