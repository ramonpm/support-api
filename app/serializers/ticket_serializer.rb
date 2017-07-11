class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :finished_at

  belongs_to :user
end
