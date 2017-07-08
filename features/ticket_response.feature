Feature: An agent or customer answer a ticket
  Both can answer a ticket multiple times

  Background:
    Given an user with id "1" and a ticket with id "1"

  Scenario: valid answer
    When the client make a valid POST /tickets/:ticket_id/answers request with user_id: "1" and ticket_id: "1"
    Then response should return an answer object and status 201

  Scenario: blank message
    When the client make a POST /tickets/:ticket_id/answers request without a message with user_id: "1" and ticket_id: "1"
    Then response should have status 422 and JSON:
    """
      {"message": ["can't be blank"]}
    """