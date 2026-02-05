class Message < ApplicationRecord
  validates :content, presence: true
  validates :username, presence: true

  after_create_commit -> { broadcast_append_to "chatroom" }
end
