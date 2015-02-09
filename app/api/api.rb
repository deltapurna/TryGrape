class API < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  helpers do
    def current_user
      @current_user ||= User.find_by(authentication_token: params[:token])
    end

    def authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end
  end

  mount Todo::TaskData
  mount Todo::Session
end
