# frozen_string_literal: true

module ResponseHelper
  # @param [Object] object any object
  # @param [Symbol] status http status name or code
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
