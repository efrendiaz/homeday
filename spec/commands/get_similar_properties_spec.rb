require 'rails_helper'
describe GetSimilarProperties do
  let(:params) do
    {
      property_type: 'apartment',
      marketing_type: 'sell',
      latitude: 52.48696,
      longitude: 13.46247
    }
  end

  let!(:property_far)  { FactoryBot.create(:property, location: "POINT(#{13.3041054} #{52.5166023})") }
  let!(:property_near) { FactoryBot.create(:property, location: "POINT(#{13.46247} #{52.48696})") }

  context 'validations' do
    it 'validates the presence of latitude' do
      outcome = described_class.run(params.slice(:property_type, :marketing_type, :longitude))
      expect(outcome.success?).to be_falsey
      expect(outcome.errors.message).to eq('latitude' => 'Latitude is required')
    end

    it 'validates the presence of longitude' do
      outcome = described_class.run(params.slice(:property_type, :marketing_type, :latitude))
      expect(outcome.success?).to be_falsey
      expect(outcome.errors.message).to eq('longitude' => 'Longitude is required')
    end

    it 'validates the presence of property_type' do
      outcome = described_class.run(params.slice(:longitude, :marketing_type, :latitude))
      expect(outcome.success?).to be_falsey
      expect(outcome.errors.message).to eq('property_type' => 'Property Type is required')
    end

    it 'validates the presence of marketing_type' do
      outcome = described_class.run(params.slice(:longitude, :property_type, :latitude))
      expect(outcome.success?).to be_falsey
      expect(outcome.errors.message).to eq('marketing_type' => 'Marketing Type is required')
    end
  end

  context '#run' do
    it 'applies the location filter' do
      outcome = described_class.run(params)
      expect(outcome.result.count).to eq 1
    end

    it 'applies the property_type filter' do
      outcome = described_class.run(params.merge(property_type: 'single_family_house'))
      expect(outcome.result.count).to eq 0
    end

    it 'applies the marketing_type filter' do
      outcome = described_class.run(params.merge(marketing_type: 'rent'))
      expect(outcome.result.count).to eq 0
    end
  end
end
