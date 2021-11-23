require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # GET
  describe 'GET users' do
    context 'when user is authenticated' do
      let(:users) { create_list(:user, 5) }
      before {
        token = JsonWebToken.encode(user_id: users.first.id)
        get '/users', params: {}, headers: { 'Authorization' => token }
      }

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end

      it 'returns all users' do
        expect(JSON.parse(response.body).size).to eq(5)
      end

      it 'returns one user' do
        get "/users/#{users.first.id}", params: {}, headers: { 'Authorization' => JsonWebToken.encode(user_id: users.first.id) }
        expect(JSON.parse(response.body)['first_name']).to eq(users.first.first_name)
        expect(JSON.parse(response.body)['last_name']).to eq(users.first.last_name)
        expect(JSON.parse(response.body)['email']).to eq(users.first.email)
      end

    end

    context 'when user is NOT authenticated' do
      it 'returns status code 401 - unauthorized' do
        get '/users'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
