class ApplicationController < ActionController::API
  
  def authenticate_user_api_key
    api_key = params[:api_key]
    @_current_user = User.find_by(api_key: api_key)

    unless @_current_user
      render json: { error: "Invalid API Key!" }, status: :unauthorized
    end
  end
end
