require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = Person.first
    # pp "Person in setup: #{@person.id}"
    person = @person
    post "/sessions.json", params: { email: person.email, password: "password" }
    data = JSON.parse(response.body)
    # pp "Setup data: #{data}"
    @jwt = data["jwt"]
  end
  
  test "create" do
    assert_difference "Person.count", 1 do
      post "/people.json", params: { first_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response 201
    end
  end

  test "index" do
    get "/people.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Person.count, data.length
  end

  test "show" do
    person = Person.first
    # pp "Person to be passed to show: #{person.id}"
    get "/people/#{person.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "first_name", "last_name", "email", "phone_number", "short_bio", "linkedin_url", "twitter_handle", "personal_blog_url", "online_resume_url", "github_url", "photo",  "created_at", "updated_at"], data.keys
  end

  test "update" do
    @person = Person.first
    # pp "Person to be passed to update: #{@person.id}"
    patch "/people/#{@person.id}.json", params: { id: @person.id,  first_name: "Updated name" }, headers: { "Authorization" => "Bearer #{@jwt}" }
    # pp @jwt
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["first_name"]
  end

  test "destroy" do
    @person = Person.all[1]
    post "/sessions.json", params: { email: @person.email, password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
    assert_difference "Person.count", -1 do
      delete "/people/#{person.id}.json", headers: { Authorization: "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
