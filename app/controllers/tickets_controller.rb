class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :update, :destroy]

  # GET /tickets
  def index
    @tickets = current_user.type == Customer.name ? current_user.tickets : Ticket.all

    render json: @tickets
  end

  def pdf_report
    tickets = Ticket.where('finished_at >= ?', 1.month.ago)
    ac = ActionController::Base.new
    html_string = ac.render_to_string template: 'tickets/pdf_report', locals: {tickets: tickets}
    pdf = WickedPdf.new.pdf_from_string(html_string)
    send_data pdf, type: 'application/pdf'
  end

  # GET /tickets/1
  def show
    render json: @ticket
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :user_id)
  end
end
