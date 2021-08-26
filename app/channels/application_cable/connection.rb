# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      uid = request.query_parameters[:uid]
      token = request.query_parameters[:token]
      client = request.query_parameters[:client]

      user = User.find_by_uid(uid)

      p user
      if user&.valid_token?(token, client)
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
