Given(/^an user with id "([^"]*)" and a ticket with id "([^"]*)"$/) do |user_id, ticket_id|
  FactoryGirl.create(:user, id: user_id)
  FactoryGirl.create(:ticket, id: ticket_id, user_id: user_id)
end

When(/^the client make a valid POST \/tickets\/:ticket_id\/answers request with user_id: "([^"]*)" and ticket_id: "([^"]*)"$/) do |user_id, ticket_id|
  params = {answer: valid_answer_creation_params(user_id, ticket_id)}
  post "/tickets/#{ticket_id}/answers", params
end

Then(/^response should return an answer object and status (\d+)$/) do |status|
  expect(last_response.status).to be(status)
  answer = Answer.new(JSON.parse(last_response.body))
  expect(answer.valid?).to be(true)
end

def valid_answer_creation_params(user_id, ticket_id)
  FactoryGirl.attributes_for(:answer).merge(user_id: user_id).merge(ticket_id: ticket_id)
end

When(/^the client make a POST \/tickets\/:ticket_id\/answers request without a message with user_id: "([^"]*)" and ticket_id: "([^"]*)"$/) do |user_id, ticket_id|
  params = {answer: valid_answer_creation_params(user_id, ticket_id).merge(message: '')}
  post "/tickets/#{ticket_id}/answers", params
end