class Answer < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :message, presence: true
end
