class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :conversation_id
  validates_presence_of :user_id

  def Message.messages(sender_id, recipient_id)
    conversation = Conversation.where(sender_id: sender_id, recipient_id: recipient_id).first
    if !conversation
      conversation = Conversation.where(sender_id: recipient_id, recipient_id: sender_id).first
    end
    Message.where(conversation_id: conversation.id)
  end
end
