require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let!(:property_far)  { FactoryBot.create(:property, location: "POINT(#{13.3041054} #{52.5166023})") }
  let!(:property_near) { FactoryBot.create(:property, location: "POINT(#{13.46247} #{52.48696})") }

  describe 'GET #index' do
    it 'gets the list of similar properties' do
      get :index, params:{ latitude: 52.48696,latitude: 13.46247, property_type: 'apartment', marketing_type: 'sell'}
      expect(response).to be_successful
    end
  end
end
