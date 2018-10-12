# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ResponseHelper
  include ExceptionHandler
end
