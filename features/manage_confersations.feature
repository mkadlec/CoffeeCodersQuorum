Feature: Manage Conversations
	Scenario: User adds a new conversation
		Given I am on the index of conversations
		When I follow "New Item"
		And I fill in "Name" with "Spuds"
		And I fill in "Description" with "Delicious potato wedges!"
		And I press "Create"
		Then I should see "Conversation was successfully created."
		And I should see "Spuds"
		And I should see "Delicious potato wedges!"