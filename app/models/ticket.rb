class Ticket < ApplicationRecord
  PENDING = 0
  ANSWERED = 10
  FINISHED = 20

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  after_initialize :default_values

  def default_values
    self.status ||= PENDING
  end
end
