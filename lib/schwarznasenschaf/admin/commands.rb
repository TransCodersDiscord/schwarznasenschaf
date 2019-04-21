# frozen_string_literal: true

module Schwarznasenschaf::Admin::Commands
  def self.send_and_delete(channel, message_text)
    sent_message = channel.send message_text

    Thread.new do
      sleep 5
      sent_message.delete
    end
    nil
  end

  def self.bulk_delete(channel, number_to_delete)
    failed_message = 'Unable to delete messages'
    return failed_message unless number_to_delete.between? 1, 99

    num_deleted = channel.prune number_to_delete + 1
    return failed_message if num_deleted < 1

    "Successfully deleted #{num_deleted - 1} messages"
  end
end
