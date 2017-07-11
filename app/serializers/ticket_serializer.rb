class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :closed_at

  belongs_to :user
end
