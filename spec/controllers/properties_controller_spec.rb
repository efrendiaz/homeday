require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let!(:property_far)  { FactoryBot.create(:property, location: "POINT(#{13.3041054} #{52.5166023})") }
  let!(:property_near) { FactoryBot.create(:property, location: "POINT(#{13.46247} #{52.48696})") }
  let(:params) do
    {
      longitude: 13.46247,
      latitude: 52.48696,
      property_type: 'apartment',
      marketing_type: 'sell'
    }
  end

  describe 'GET #index' do
    context 'with valid params' do
      it 'gets the list of similar properties' do
        get :index, params: params
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.size).to eql 1
        expect(parsed_response.first.symbolize_keys).to eql PropertyPresenter.present(property_near)
      end
    end

    context 'with invalid params' do
      it 'returns a proper error message' do
        get :index, params: params.slice(:longitude, :latitude, :property_type)
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to eql('marketing_type' => 'Marketing Type is required')
      end
    end
  end
end
