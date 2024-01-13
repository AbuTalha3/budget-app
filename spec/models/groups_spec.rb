require 'rails_helper'

RSpec.describe 'GroupsController', type: :request do
  describe 'GET /index' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    before do
      allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(GroupsController).to receive(:current_user).and_return(user)
      get groups_path
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to match(/GROUPS/i)
    end
  end

  describe 'GET /show' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:group) { Group.create(name: 'Group 1', icon: 'icon.png', user:) }

    before do
      allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(GroupsController).to receive(:current_user).and_return(user)
      get group_path(group)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to match(/GROUPS/i)
    end
  end

  describe 'GET /new' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    before do
      allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(GroupsController).to receive(:current_user).and_return(user)
      get new_group_path
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to match(/NEW GROUP/i)
    end
  end

  describe 'POST /create' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    before do
      allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(GroupsController).to receive(:current_user).and_return(user)
      post groups_path, params: { group: { name: 'Test Group', icon: 'test_icon.png' } }
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(flash[:notice]).to match(/category was created/i)
    end
  end

  describe 'GET /edit' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:group) { Group.create(name: 'Group 1', icon: 'icon.png', user:) }

    before do
      allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(GroupsController).to receive(:current_user).and_return(user)
      get edit_group_path(group)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to match(/EDIT GROUP/i)
    end
  end

  describe 'DELETE /destroy' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:group) { Group.create(name: 'Group 1', icon: 'icon.png', user:) }

    before do
      allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(GroupsController).to receive(:current_user).and_return(user)
      delete group_path(group)
    end

    it 'returns a redirect response' do
      expect(response).to have_http_status(302)
    end

    it 'redirects to the correct path' do
      expect(response).to redirect_to(groups_path)
    end
  end
end
