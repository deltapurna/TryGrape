module Todo
  class Session < Grape::API
    resource :sign_in do
      desc "Login"
      params do
        requires :email, type: String, desc: "User email."
        requires :password, type: String, desc: "User password."
      end
      post do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          user
        else
          error!('Wrong username or password', 401)
        end
      end
    end
  end
end
