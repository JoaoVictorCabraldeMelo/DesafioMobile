# frozen_string_literal: true

# Controle de teste se api esta funcionando
module Api
  module V1
    class PostController < ApiController
      before_action :authenticate_user!

      def index
        puts current_user.email
        render json: { user: current_user.email, list: [1, 2, 3] }
      end
    end
  end
end
