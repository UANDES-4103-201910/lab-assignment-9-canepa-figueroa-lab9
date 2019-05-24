class CartController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_tickets = UserTicket.where(user_id: current_user.id, paid: false)
  end

  def pay
    @total = 0
    @paid_tickets = UserTicket.where(user_id: current_user.id, paid: false)
    @paid_tickets_l = UserTicket.where(user_id: current_user.id, paid: false).length
    @tickets_info = Array.new
    if @paid_tickets_l > 0
      @paid_tickets.each do |user_ticket|
        user_ticket.update(paid: true)
        @total += user_ticket.ticket.price
      end
    else
      flash[:notice] = "You have no  tickets in your cart"
      redirect_to events_path
    end

  end

end
