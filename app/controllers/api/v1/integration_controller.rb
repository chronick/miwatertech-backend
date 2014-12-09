class Api::V1::IntegrationController < ApplicationController
  respond_to :json

  def readings
    begin
      my_params = permitted_params

      if my_params.is_a?(Array)
        data = permitted_params_array
        @readings = Reading.create(data[:readings])
        if @readings.to_a.all? { |t| t.valid? }
          render json: {message: 'Accepted'}, status: 202
        else
          render json: {errors: @readings.errors.full_messages}, status: 400
        end
      else
        data = permitted_params_object
        @reading = Reading.create(data)
        if @reading.valid?
          render json: {message: 'Created'}, status: 201
        else
          render json: {errors: @reading.errors.full_messages}, status: 400
        end
      end

    rescue => e
      render json: {message: 'There was a problem parsing the data', exception: e.to_s}, status: 400
    end
  end

  def permitted_params
    params.require(:readings)
  end

  def permitted_params_object
    params.require(:readings).permit(:account_number, :read_at, :read_type, :usage)
  end

  def permitted_params_array
    params.permit(readings: [:account_number, :read_at, :read_type, :usage])
  end
end
