class SessionsController < ApplicationController
  def create
    person = Person.find_by(email: params[:email])
    if person && person.authenticate(params[:password])
      jwt = JWT.encode(
        {
          person_id: person.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, email: person.email, person_id: person.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
