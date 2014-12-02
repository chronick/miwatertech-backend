class Api::V1::IntegrationController < ApplicationController
  respond_to :json

  def readings
    begin
      @readings = Reading.create(permitted_params[:readings])
      if @readings.all? { |t| t.valid? }
        render json: { message: 'Accepted' }, status: 202
      else
        render json: { errors: @readings.errors.full_messages }, status: 400
      end
    rescue => e
      render json: { message: 'There was a problem parsing the data', exception: e.to_s }, status: 400
    end
  end

  def permitted_params
    params.permit(readings: [:account_number, :read_at, :read_type, :usage])
  end
end
