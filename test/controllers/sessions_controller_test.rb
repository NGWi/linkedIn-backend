require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = Person.first
  end

  test "create" do
    person = @person
    post "/people.json", params: { first_name: person.first_name, email: person.email, password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { email: person.email, password: "password" }
    assert_response 201

    data = JSON.parse(response.body)
    assert_equal ["jwt", "email", "person_id"], data.keys
  end
end
