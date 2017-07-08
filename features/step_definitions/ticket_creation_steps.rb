Given(/^a user with id "([^"]*)"$/) do |id|
  FactoryGirl.create(:user, id: id)
end

When(/^the client make a valid POST \/tickets request with user_id: "([^"]*)"$/) do |id|
  params = {ticket: valid_ticket_creation_params(id)}
  post '/tickets', params
end

Then(/^response should return a ticket\.status: (\d+) and status (\d+)$/) do |ticket_status, http_status|
  expect(last_response.status).to be(http_status)
  ticket = Ticket.new(JSON.parse(last_response.body))
  expect(ticket.status).to be(ticket_status)
end

When(/^the client make a POST \/tickets request with blank title and user_id: "([^"]*)"$/) do |id|
  params = {ticket: valid_ticket_creation_params(id).merge(title: '')}
  post '/tickets', params
end

Then(/^response should have status (\d+) and JSON:$/) do |status, json_string|
  expect(last_response.status).to be(status)
  expect(JSON.parse(last_response.body)).to eq(JSON.parse(json_string))
end

def valid_ticket_creation_params(user_id)
  FactoryGirl.attributes_for(:ticket).merge(user_id: user_id)
end

Transform(/(\d+)$/) {|number| number.to_i}