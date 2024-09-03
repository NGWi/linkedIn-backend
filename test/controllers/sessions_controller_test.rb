require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/people.json", params: { first_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    assert_response 201

    data = JSON.parse(response.body)
    assert_equal ["jwt", "email", "person_id"], data.keys
  end
end
