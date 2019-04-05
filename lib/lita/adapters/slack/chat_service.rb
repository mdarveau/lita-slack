require "lita/adapters/slack/attachment"

module Lita
  module Adapters
    class Slack < Adapter
      # Slack-specific features made available to +Lita::Robot+.
      # @api public
      # @since 1.6.0
      class ChatService
        attr_accessor :api

        # @param config [Lita::Configuration] The adapter's configuration data.
        def initialize(config)
          self.api = API.new(config)
        end

        # @param target [Lita::Room, Lita::User] A room or user object indicating where the
        #   attachment should be sent.
        # @param attachments [Attachment, Array<Attachment>] An {Attachment} or array of
        #   {Attachment}s to send.
        # @return [void]
        def send_attachments(target, attachments)
          api.send_attachments(target, Array(attachments))
        end
        alias_method :send_attachment, :send_attachments

        # @param target [Lita::Room, Lita::User] A room or user object indicating where the
        #   attachment should be sent.
        # @param user Lita::User A user object indicating whom should receive the ephemeral message.
        # @param attachments [Attachment, Array<Attachment>] An {Attachment} or array of {Attachment}s to send.
        # @return [void]
        def send_ephemeral_attachments(target, user, attachments)
          api.send_ephemeral_attachments(target, user, Array(attachments))
        end
        alias_method :send_ephemeral_attachment, :send_ephemeral_attachments

        # @param target [Lita::Room, Lita::User] A room or user object indicating where the
        #   attachment should be sent.
        # @param user Lita::User A user object indicating whom should receive the ephemeral message.
        # @param messages [String, Array<String>] A {String} or array of {String}s to send.
        # @return [void]
        def send_ephemeral_messages(target, user, messages)
          api.send_ephemeral_messages(target, user, Array(messages))
        end
        alias_method :send_ephemeral_message, :send_ephemeral_messages
      end
    end
  end
end
