require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
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
    get "/people/#{Person.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "first_name", "last_name", "email", "phone_number", "short_bio", "linkedin_url", "twitter_handle", "personal_blog_url", "online_resume_url", "github_url", "photo", "password_digest", "created_at", "updated_at"], data.keys
  end
end
