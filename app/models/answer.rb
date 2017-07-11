class Answer < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  after_create :change_ticket_status

  validates :message, presence: true


  private

  def change_ticket_status
    if (ticket.status == Ticket::PENDING) && (user.type != Customer.name)
      ticket.status = Ticket::ANSWERED
      ticket.save
    end
  end
end
