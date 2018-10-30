class PropertyPresenter
  include ActionView::Helpers::NumberHelper
  class << self
    def present(property)
      new(property).to_hash
    end
  end

  attr_reader :property

  def initialize(property)
    @property = property
  end

  def to_hash
    {
      house_number: property.house_number,
      street: property.street,
      city: property.city,
      zip_code: property.zip_code,
      construction_year: property.construction_year,
      number_of_rooms: number_to_human(property.number_of_rooms),
      price: number_to_currency(property.price, unit: '€'),
      lat: property.location.lat,
      lng: property.location.lon
    }
  end
end
