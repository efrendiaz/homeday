class GetSimilarProperties < Mutations::Command

  # These inputs are required
  required do
    float :latitude
    float :longitude
    string :property_type, in: %w[apartment single_family_house]
    string :marketing_type, in: %w[sell rent]
  end

  def execute
    Property.within(latitude,longitude).property_type(property_type).offer_type(marketing_type)
  end
end
