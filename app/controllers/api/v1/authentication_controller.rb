# frozen_string_literal: true

# Para rotas de logar e retornar o JWT
module Api
  module V1
    class AuthenticationController < ApiController
      skip_before_action :authenticate_user!, only: [:create]

      def create
        user = User.find_by(email: params[:email])
        puts user
        if user&.valid_password?(params[:password])
          render json: { token: JsonWebToken.encode(sub: user.id) }
        else
          render json: { errors: 'invalid' }
        end
      end

      def fetch
        render json: current_user
      end
    end
  end
end
