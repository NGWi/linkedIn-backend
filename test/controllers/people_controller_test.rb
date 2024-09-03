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
end
