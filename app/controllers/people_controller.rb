class PeopleController < ApplicationController
  def create
    person = Person.new(
      first_name: params[:first_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if person.save
      render json: { message: "Person created successfully" }, status: :created
    else
      render json: { errors: person.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @people = Person.all
    render :index
  end

  def show
    @person = Person.find_by(id: params[:id])
    render :show
  end
end
