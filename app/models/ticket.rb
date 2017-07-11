class Ticket < ApplicationRecord
  PENDING = 0
  ANSWERED = 10
  CLOSED = 20

  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true

  after_initialize :default_values

  def default_values
    self.status ||= PENDING
  end
end
