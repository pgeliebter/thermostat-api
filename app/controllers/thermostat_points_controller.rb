class ThermostatPointsController < ApplicationController
  def index
    render json: { points: ThermostatPoint.all }
  end
end
