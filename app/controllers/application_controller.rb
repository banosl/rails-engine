class ApplicationController < ActionController::API
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # def render_not_found_response(exception)
  #   render json: {Error: { status: "404", code: exception.message } }
  # end
end
