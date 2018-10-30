class PropertiesController < ApplicationController
  def index
    outcome = GetSimilarProperties.run(property_params)
    if outcome.success?
      render json: outcome.result.map{ |property| PropertyPresenter.present(property) }
    else
      render json: { errors: outcome.errors.message }
    end
  end

  private

  def property_params
    params.permit(:longitude, :latitude, :property_type, :marketing_type)
  end
end
