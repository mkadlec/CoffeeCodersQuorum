require 'test_helper'

class ConversationTest < ActiveSupport::TestCase

	def test_conversation_without_a_name_is_invalid
		# sign_in User.first
		conversation = Conversation.new
		assert conversation.name.blank?
		assert !conversation.valid?
	end

end
