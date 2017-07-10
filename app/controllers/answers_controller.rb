class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:show, :update, :destroy]

  # GET /answers
  def index
    @answers = Answer.where(ticket_id: params[:ticket_id])

    render json: @answers, include: {user: {only: :email}}
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    if @answer.save
      render json: @answer, include: {user: {only: :email}}, status: :created, location: ticket_answer_path(@answer.ticket_id, @answer.id)
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def answer_params
    params.require(:answer).permit(:message, :ticket_id, :user_id)
  end
end
