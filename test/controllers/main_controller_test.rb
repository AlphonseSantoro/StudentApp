require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get hovedside" do
    get :hovedside
    assert_response :success
  end

  test "should get profil" do
    get :profil
    assert_response :success
  end

end
