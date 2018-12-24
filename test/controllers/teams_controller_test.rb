# frozen_string_literal: true

require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get teams_name:string_url
    assert_response :success
  end

  test "should get references:user" do
    get teams_references:user_url
    assert_response :success
  end

end
