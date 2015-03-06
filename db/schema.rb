# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150305202508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fd_cargos", force: true do |t|
    t.string   "nome_cargo"
    t.string   "desc_cargo"
    t.datetime "data_exclusao"
    t.integer  "fd_empresa_id"
    t.integer  "user_exclusao"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_cargos", ["fd_empresa_id"], name: "index_fd_cargos_on_fd_empresa_id", using: :btree

  create_table "fd_categoriaempresas", force: true do |t|
    t.string   "nome_categoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fd_categoriaprodutos", force: true do |t|
    t.string   "desc_categoria"
    t.boolean  "flag_global"
    t.integer  "father_id"
    t.integer  "integer"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fd_cidades", force: true do |t|
    t.string   "nome_cidade"
    t.integer  "fd_estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_cidades", ["fd_estado_id"], name: "index_fd_cidades_on_fd_estado_id", using: :btree

  create_table "fd_clientes", force: true do |t|
    t.string   "nome_cliente"
    t.string   "desc_sexo"
    t.string   "desc_celular"
    t.string   "desc_telefone"
    t.string   "desc_email"
    t.string   "desc_cpf"
    t.date     "data_nascimento"
    t.datetime "data_inclusao"
    t.integer  "fd_empresa_id"
    t.integer  "fd_endereco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_clientes", ["fd_empresa_id"], name: "index_fd_clientes_on_fd_empresa_id", using: :btree
  add_index "fd_clientes", ["fd_endereco_id"], name: "index_fd_clientes_on_fd_endereco_id", using: :btree

  create_table "fd_empresas", force: true do |t|
    t.string   "desc_razaosocial"
    t.string   "desc_nomefantasia"
    t.string   "nome_responsavel"
    t.string   "desc_cnpj"
    t.string   "desc_telefone"
    t.string   "desc_celular"
    t.datetime "data_inclusao"
    t.integer  "fd_endereco_id"
    t.integer  "fd_categoriaempresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_empresas", ["fd_categoriaempresa_id"], name: "index_fd_empresas_on_fd_categoriaempresa_id", using: :btree
  add_index "fd_empresas", ["fd_endereco_id"], name: "index_fd_empresas_on_fd_endereco_id", using: :btree

  create_table "fd_enderecos", force: true do |t|
    t.string   "nome_bairro"
    t.string   "nome_rua"
    t.string   "numr_quadra"
    t.string   "desc_complemento"
    t.string   "desc_pontoreferencia"
    t.string   "numr_cep"
    t.datetime "data_inclusao"
    t.integer  "fd_cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_enderecos", ["fd_cidade_id"], name: "index_fd_enderecos_on_fd_cidade_id", using: :btree

  create_table "fd_estados", force: true do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fd_formapagamentos", force: true do |t|
    t.string   "desc_formapagamento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fd_funcionarios", force: true do |t|
    t.string   "nome_funcionario"
    t.string   "desc_telefone"
    t.string   "desc_celular"
    t.datetime "data_exclusao"
    t.integer  "fd_cargo_id"
    t.integer  "fd_endereco_id"
    t.integer  "fd_empresa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_funcionarios", ["fd_cargo_id"], name: "index_fd_funcionarios_on_fd_cargo_id", using: :btree
  add_index "fd_funcionarios", ["fd_empresa_id"], name: "index_fd_funcionarios_on_fd_empresa_id", using: :btree
  add_index "fd_funcionarios", ["fd_endereco_id"], name: "index_fd_funcionarios_on_fd_endereco_id", using: :btree

  create_table "fd_itempedidos", force: true do |t|
    t.string   "desc_observacao"
    t.decimal  "valr_item"
    t.string   "tipo_atendimento"
    t.integer  "fd_empresa_id"
    t.integer  "fd_variacaoproduto_id"
    t.integer  "fd_pedido_id"
    t.integer  "fd_status_id"
    t.integer  "fd_funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_itempedidos", ["fd_empresa_id"], name: "index_fd_itempedidos_on_fd_empresa_id", using: :btree
  add_index "fd_itempedidos", ["fd_funcionario_id"], name: "index_fd_itempedidos_on_fd_funcionario_id", using: :btree
  add_index "fd_itempedidos", ["fd_pedido_id"], name: "index_fd_itempedidos_on_fd_pedido_id", using: :btree
  add_index "fd_itempedidos", ["fd_status_id"], name: "index_fd_itempedidos_on_fd_status_id", using: :btree
  add_index "fd_itempedidos", ["fd_variacaoproduto_id"], name: "index_fd_itempedidos_on_fd_variacaoproduto_id", using: :btree

  create_table "fd_items", force: true do |t|
    t.string   "desc_item"
    t.datetime "data_exclusao"
    t.integer  "fd_empresa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_items", ["fd_empresa_id"], name: "index_fd_items_on_fd_empresa_id", using: :btree

  create_table "fd_itensadicionals", force: true do |t|
    t.integer  "fd_item_id"
    t.integer  "fd_categoriaproduto_id"
    t.decimal  "valr_item"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_itensadicionals", ["fd_categoriaproduto_id"], name: "index_fd_itensadicionals_on_fd_categoriaproduto_id", using: :btree
  add_index "fd_itensadicionals", ["fd_item_id"], name: "index_fd_itensadicionals_on_fd_item_id", using: :btree

  create_table "fd_itensprodutos", force: true do |t|
    t.integer  "fd_produto_id"
    t.integer  "fd_item_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_itensprodutos", ["fd_item_id"], name: "index_fd_itensprodutos_on_fd_item_id", using: :btree
  add_index "fd_itensprodutos", ["fd_produto_id"], name: "index_fd_itensprodutos_on_fd_produto_id", using: :btree

  create_table "fd_mesas", force: true do |t|
    t.integer  "numr_mesa"
    t.string   "desc_mesa"
    t.boolean  "flag_mesaaberta"
    t.integer  "fd_empresa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.datetime "data_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_mesas", ["fd_empresa_id"], name: "index_fd_mesas_on_fd_empresa_id", using: :btree

  create_table "fd_pedidos", force: true do |t|
    t.decimal  "valr_pedido"
    t.boolean  "flag_pago"
    t.integer  "fd_empresa_id"
    t.integer  "fd_cliente_id"
    t.integer  "fd_mesa_id"
    t.integer  "fd_funcionario_id"
    t.integer  "fd_formapagamento_id"
    t.integer  "fd_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_pedidos", ["fd_cliente_id"], name: "index_fd_pedidos_on_fd_cliente_id", using: :btree
  add_index "fd_pedidos", ["fd_empresa_id"], name: "index_fd_pedidos_on_fd_empresa_id", using: :btree
  add_index "fd_pedidos", ["fd_formapagamento_id"], name: "index_fd_pedidos_on_fd_formapagamento_id", using: :btree
  add_index "fd_pedidos", ["fd_funcionario_id"], name: "index_fd_pedidos_on_fd_funcionario_id", using: :btree
  add_index "fd_pedidos", ["fd_mesa_id"], name: "index_fd_pedidos_on_fd_mesa_id", using: :btree
  add_index "fd_pedidos", ["fd_status_id"], name: "index_fd_pedidos_on_fd_status_id", using: :btree

  create_table "fd_produtos", force: true do |t|
    t.string   "nome_produto"
    t.string   "desc_produto"
    t.float    "numr_porcentagem"
    t.integer  "fd_empresa_id"
    t.integer  "fd_categoriaproduto_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_produtos", ["fd_categoriaproduto_id"], name: "index_fd_produtos_on_fd_categoriaproduto_id", using: :btree
  add_index "fd_produtos", ["fd_empresa_id"], name: "index_fd_produtos_on_fd_empresa_id", using: :btree

  create_table "fd_produtoscombos", force: true do |t|
    t.integer  "fd_produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_produtoscombos", ["fd_produto_id"], name: "index_fd_produtoscombos_on_fd_produto_id", using: :btree

  create_table "fd_statuses", force: true do |t|
    t.string   "nome_status"
    t.string   "desc_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fd_usuarios", force: true do |t|
    t.string   "desc_nome"
    t.string   "desc_login"
    t.string   "desc_senha"
    t.datetime "data_inclusao"
    t.string   "desc_perfil"
    t.integer  "fd_empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_usuarios", ["fd_empresa_id"], name: "index_fd_usuarios_on_fd_empresa_id", using: :btree

  create_table "fd_variacaoprodutos", force: true do |t|
    t.decimal  "valr_produto"
    t.integer  "fd_variaco_id"
    t.integer  "fd_produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_variacaoprodutos", ["fd_produto_id"], name: "index_fd_variacaoprodutos_on_fd_produto_id", using: :btree
  add_index "fd_variacaoprodutos", ["fd_variaco_id"], name: "index_fd_variacaoprodutos_on_fd_variaco_id", using: :btree

  create_table "fd_variacaos", force: true do |t|
    t.string   "desc_variacao"
    t.integer  "fd_empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "flag_global"
  end

  add_index "fd_variacaos", ["fd_empresa_id"], name: "index_fd_variacaos_on_fd_empresa_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
