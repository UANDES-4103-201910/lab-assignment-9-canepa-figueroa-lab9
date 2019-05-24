class UserTicketsController < ApplicationController
  before_action :set_user_ticket, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token
  # GET /user_tickets
  # GET /user_tickets.json
  def index
    @user_tickets = UserTicket.all
  end

  # GET /user_tickets/1
  # GET /user_tickets/1.json
  def show
  end

  # GET /user_tickets/new
  def new
    @user_ticket = UserTicket.new
  end

  # GET /user_tickets/1/edit
  def edit
  end

  # POST /user_tickets
  # POST /user_tickets.json
  def create
    @user_ticket = UserTicket.new(user_ticket_params)
    @user_ticket.user_id = current_user.id
    @user_ticket.time = Time.now
    @user_ticket.paid = false
    respond_to do |format|
      if @user_ticket.save
        format.html { redirect_to cart_path, notice: 'Ticket was successfully added to cart.' }
        format.json { render :show, status: :created, location: @user_ticket }
      else
        format.html { redirect_to root_path, notice: 'Error adding ticket to cart' }
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tickets/1
  # PATCH/PUT /user_tickets/1.json
  def update
    respond_to do |format|
      if @user_ticket.update(user_ticket_params)
        format.html { redirect_to @user_ticket, notice: 'User ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_ticket }
      else
        format.html { render :edit }
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tickets/1
  # DELETE /user_tickets/1.json
  def destroy
    @user_ticket.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Ticket removed from Cart successfully' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_ticket
      @user_ticket = UserTicket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_ticket_params
      # params.fetch(:user_ticket, {})
      # params.require(:user_ticket).permit(:user_id, :ticket_id)
      # params.permit(:user_id, :ticket_id)
      params.require(:user_ticket).permit(:ticket_id)
    end
end
