require 'test_helper'

class MedicalKitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_kit = medical_kits(:one)
  end

  test "should get index" do
    get medical_kits_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_kit_url
    assert_response :success
  end

  test "should create medical_kit" do
    assert_difference('MedicalKit.count') do
      post medical_kits_url, params: { medical_kit: { components: @medical_kit.components, name: @medical_kit.name } }
    end

    assert_redirected_to medical_kit_url(MedicalKit.last)
  end

  test "should show medical_kit" do
    get medical_kit_url(@medical_kit)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_kit_url(@medical_kit)
    assert_response :success
  end

  test "should update medical_kit" do
    patch medical_kit_url(@medical_kit), params: { medical_kit: { components: @medical_kit.components, name: @medical_kit.name } }
    assert_redirected_to medical_kit_url(@medical_kit)
  end

  test "should destroy medical_kit" do
    assert_difference('MedicalKit.count', -1) do
      delete medical_kit_url(@medical_kit)
    end

    assert_redirected_to medical_kits_url
  end
end
