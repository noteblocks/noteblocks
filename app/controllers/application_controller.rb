class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include Response
  include ExceptionHandler
end
