require 'test_helper'

class FdServicosControllerTest < ActionController::TestCase
  setup do
    @fd_servico = fd_servicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_servicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_servico" do
    assert_difference('FdServico.count') do
      post :create, fd_servico: { data_exclusao: @fd_servico.data_exclusao, desc_servico: @fd_servico.desc_servico, flag_ativo: @fd_servico.flag_ativo, numr_porcentagem: @fd_servico.numr_porcentagem, valr_servico: @fd_servico.valr_servico }
    end

    assert_redirected_to fd_servico_path(assigns(:fd_servico))
  end

  test "should show fd_servico" do
    get :show, id: @fd_servico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_servico
    assert_response :success
  end

  test "should update fd_servico" do
    patch :update, id: @fd_servico, fd_servico: { data_exclusao: @fd_servico.data_exclusao, desc_servico: @fd_servico.desc_servico, flag_ativo: @fd_servico.flag_ativo, numr_porcentagem: @fd_servico.numr_porcentagem, valr_servico: @fd_servico.valr_servico }
    assert_redirected_to fd_servico_path(assigns(:fd_servico))
  end

  test "should destroy fd_servico" do
    assert_difference('FdServico.count', -1) do
      delete :destroy, id: @fd_servico
    end

    assert_redirected_to fd_servicos_path
  end
end
