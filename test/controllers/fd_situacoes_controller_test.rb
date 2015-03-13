require 'test_helper'

class FdSituacoesControllerTest < ActionController::TestCase
  setup do
    @fd_situacao = fd_situacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_situacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_situacao" do
    assert_difference('FdSituacao.count') do
      post :create, fd_situacao: { data_bloqueio: @fd_situacao.data_bloqueio, desc_situacao: @fd_situacao.desc_situacao, nome_situacao: @fd_situacao.nome_situacao }
    end

    assert_redirected_to fd_situacao_path(assigns(:fd_situacao))
  end

  test "should show fd_situacao" do
    get :show, id: @fd_situacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_situacao
    assert_response :success
  end

  test "should update fd_situacao" do
    patch :update, id: @fd_situacao, fd_situacao: { data_bloqueio: @fd_situacao.data_bloqueio, desc_situacao: @fd_situacao.desc_situacao, nome_situacao: @fd_situacao.nome_situacao }
    assert_redirected_to fd_situacao_path(assigns(:fd_situacao))
  end

  test "should destroy fd_situacao" do
    assert_difference('FdSituacao.count', -1) do
      delete :destroy, id: @fd_situacao
    end

    assert_redirected_to fd_situacoes_path
  end
end
