require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'POST create' do

    context 'with valid parameters' do
      before do
        post :create, params: {ticket: FactoryGirl.attributes_for(:ticket).merge(user_id: 1)}
      end
      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end
      it 'returns created ticket object' do
        ticket = Ticket.new(JSON.parse(response.body))
        expect(ticket).to be_truthy
      end
    end

    context 'with validation error' do
      before do
        post :create, params: {ticket: FactoryGirl.attributes_for(:ticket).merge(user_id: 1, title: '')}
      end
      it 'returns model validation errors' do
        expect(JSON.parse(response.body))
            .to eq(JSON.parse('{"title": ["can\'t be blank"] }'))
      end
    end
  end
end
