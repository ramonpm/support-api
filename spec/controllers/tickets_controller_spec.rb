require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'POST create' do
    let(:ticket) { FactoryGirl.build(:ticket, id: 1) }
    let(:params) {{ticket: FactoryGirl.attributes_for(:ticket).merge(user_id: 1)}}
    let(:permitted_params) { ActionController::Parameters.new(params) }
    let(:execute_request) {post :create, params: params}

    before(:all) do
      ActionController::Parameters.permit_all_parameters = true
    end

    context 'with valid parameters' do
      before do
        FactoryGirl.create(:user, id: 1)
        execute_request
      end
      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end
      it 'returns created ticket object' do
        ticket = Ticket.new(JSON.parse(response.body))
        expect(ticket).to be_truthy
      end
    end
  end
end
