class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :tickets
  has_many :answers

  def serializable_hash(options = nil)
    super.merge 'type' => type
  end
end
