require 'rails_helper'

RSpec.describe 'EntitiesController', type: :request do
  describe 'GET /new' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    before do
      allow_any_instance_of(EntitiesController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(EntitiesController).to receive(:current_user).and_return(user)
      get new_entity_path
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:new)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to match(%r{<label.*?>.*?Group.*?</label>}i)
    end
  end
end
