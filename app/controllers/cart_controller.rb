class CartController < ApplicationController
  def index
    @user_tickets = UserTicket.where(user_id: current_user.id, paid: false)
  end

  def pay
    @user_tickets = UserTicket.where(user_id: current_user.id, paid: false)
    if @user_tickets
      @user_tickets.each do |ticket|
        ticket.update(paid:true)
      end
      flash[:notice] = "Successfully paid"
    else
      flash[:notice] = "You have not tickets in your cart"
    end
    redirect_to events_path

  end

end
