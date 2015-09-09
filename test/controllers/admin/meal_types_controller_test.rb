require 'test_helper'

class Admin::MealTypesControllerTest < ActionController::TestCase
  setup do
    @meal_type = meal_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meal_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meal_type" do
    assert_difference('MealType.count') do
      post :create, meal_type: { name: @meal_type.name, recipe_id: @meal_type.recipe_id }
    end

    assert_redirected_to admin_meal_type_path(assigns(:meal_type))
  end

  test "should show meal_type" do
    get :show, id: @meal_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meal_type
    assert_response :success
  end

  test "should update meal_type" do
    patch :update, id: @meal_type, meal_type: { name: @meal_type.name, recipe_id: @meal_type.recipe_id }
    assert_redirected_to admin_meal_type_path(assigns(:meal_type))
  end

  test "should destroy meal_type" do
    assert_difference('MealType.count', -1) do
      delete :destroy, id: @meal_type
    end

    assert_redirected_to admin_meal_types_path
  end
end
