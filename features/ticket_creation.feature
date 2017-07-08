Feature: Create a ticket
  In order to support a customer he needs to create a ticket

  Background:
    Given an user with id "1"

  Scenario: using valid data
    When the client make a valid POST /tickets request with user_id: "1"
    Then response should return a ticket.status: 0 and status 201

  Scenario: using blank title
    When the client make a POST /tickets request with blank title and user_id: "1"
    Then response should have status 422 and JSON:
    """
      {"title": ["can't be blank"]}
    """