require "rails_helper"

RSpec.describe Property, type: :model do
  let!(:property_far)  { FactoryBot.create(:property, location: "POINT(#{13.3041054} #{52.5166023})") }
  let!(:property_near) { FactoryBot.create(:property, location: "POINT(#{13.46247} #{52.48696})") }

  context '#within' do
    it 'returns the properties within the range' do
      expect(Property.within(52.48696, 13.46249).count).to eq 1
    end
  end

  context '#offer_type' do
    it 'filters properties by offer type' do
      expect(Property.offer_type('sell').count).to eq 2
      expect(Property.offer_type('rent').count).to eq 0
    end
  end

  context '#property_type' do
    it 'filters properties by property type' do
      expect(Property.property_type('apartment').count).to eq 2
      expect(Property.property_type('single_family_house').count).to eq 0
    end
  end
end
