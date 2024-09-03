require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Person.count", 1 do
      post "/people.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response 201
    end
  end
end
