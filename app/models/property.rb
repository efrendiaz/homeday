class Property < ApplicationRecord
  scope :within, lambda { |latitude, longitude, distance_in_kms = 5|
    where(format('ST_Distance(location,\'POINT(%<lgn>s %<lat>s)\') < %<distance>d',
                 lgn: longitude,
                 lat: latitude,
                 distance: distance_in_kms * 1000))
  }

  scope :offer_type, ->(type) { where(offer_type: type) }
  scope :property_type, ->(type) { where(property_type: type) }

end
