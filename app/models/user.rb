class User < ApplicationRecord
  has_many :tickets
  has_many :answers
end
