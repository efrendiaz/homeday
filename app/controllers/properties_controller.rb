class PropertiesController < ApplicationController
  def index
    outcome = GetSimilarProperties.run(property_params)
    if outcome.success?
      render json: { properties: outcome.result }
    else
      render json: { error: outcome.errors.message }
    end
  end

  private

  def property_params
    params.permit(:longitude, :latitude, :property_type, :marketing_type)
  end
end
