require 'test_helper'

class FdEnderecosControllerTest < ActionController::TestCase
  setup do
    @fd_endereco = fd_enderecos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_enderecos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_endereco" do
    assert_difference('FdEndereco.count') do
      post :create, fd_endereco: { data_inclusao: @fd_endereco.data_inclusao, desc_complemento: @fd_endereco.desc_complemento, desc_pontoreferencia: @fd_endereco.desc_pontoreferencia, fd_endereco_id: @fd_endereco.fd_endereco_id, nome_bairro: @fd_endereco.nome_bairro, nome_rua: @fd_endereco.nome_rua, numr_cep: @fd_endereco.numr_cep, numr_quadra: @fd_endereco.numr_quadra }
    end

    assert_redirected_to fd_endereco_path(assigns(:fd_endereco))
  end

  test "should show fd_endereco" do
    get :show, id: @fd_endereco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_endereco
    assert_response :success
  end

  test "should update fd_endereco" do
    patch :update, id: @fd_endereco, fd_endereco: { data_inclusao: @fd_endereco.data_inclusao, desc_complemento: @fd_endereco.desc_complemento, desc_pontoreferencia: @fd_endereco.desc_pontoreferencia, fd_endereco_id: @fd_endereco.fd_endereco_id, nome_bairro: @fd_endereco.nome_bairro, nome_rua: @fd_endereco.nome_rua, numr_cep: @fd_endereco.numr_cep, numr_quadra: @fd_endereco.numr_quadra }
    assert_redirected_to fd_endereco_path(assigns(:fd_endereco))
  end

  test "should destroy fd_endereco" do
    assert_difference('FdEndereco.count', -1) do
      delete :destroy, id: @fd_endereco
    end

    assert_redirected_to fd_enderecos_path
  end
end
