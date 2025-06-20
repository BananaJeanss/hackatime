module Api
  module V1
    module Authenticated
      class MeController < ApplicationController
        def index
          render json: {
            emails: current_user.email_addresses&.map(&:email)|| [],
            slack_id: current_user.slack_uid,
            trust_factor: {
              trust_level: current_user.trust_level,
              trust_value: User.trust_levels[current_user.trust_level]
            }
          }
        end
      end
    end
  end
end
