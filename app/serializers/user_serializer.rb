class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :type, :removable

  def removable
    (object.answers.count == 0) && (object.tickets.count == 0)
  end
end
