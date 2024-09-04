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

  def update
    @person = Person.find_by(id: params[:id])
    @person.update(
      first_name: params[:first_name] || @person.first_name,
      last_name: params[:last_name] || @person.last_name,
      email: params[:email] || @person.email,
      phone_number: params[:phone_number] || @person.phone_number,
      short_bio: params[:short_bio] || @person.short_bio,
      linkedin_url: params[:linkedin_url] || @person.linkedin_url,
      twitter_handle: params[:twitter_handle] || @person.twitter_handle,
      personal_blog_url: params[:personal_blog_url] || @person.personal_blog_url,
      online_resume_url: params[:online_resume_url] || @person.online_resume_url,
      github_url: params[:github_url] || @person.github_url,
      photo: params[:photo] || @person.photo,
      password: params[:password] || @person.password,
      password_confirmation: params[:password_confirmation] || @person.password_confirmation,
    )
    render :show
  end

  def destroy
    @person = Person.find_by(id: params[:id])
    @person.destroy
    render json: { message: "Deleted Successfully" }
  end
end
