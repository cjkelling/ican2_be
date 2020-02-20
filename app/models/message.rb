class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :conversation_id
  validates_presence_of :user_id

  def Message.messages(id)
    Message.where({conversation_id: id})
  end
end
