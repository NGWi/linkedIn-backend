class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def current_person
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        person.find_by(id: decoded_token[0]["person_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  def authenticate_person
    unless current_person
      render json: {}, status: :unauthorized
    end
  end
end
