class UserTokenController < Knock::AuthTokenController
  protect_from_forgery with: :null_session
    def create
      email = request.params["auth"] && request.params["auth"]["email"]
      user = User.find_by(email: email)
      body = {
        jwt: auth_token.token,
        user: { id: user.id, name: user.name, email: user.email }
      }
      render json: body, status: :created
    end

end
