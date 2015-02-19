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

ActiveRecord::Schema.define(version: 20150219080028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fd_categoriaempresas", force: true do |t|
    t.string   "nome_categoria"
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

  create_table "fd_usuarios", force: true do |t|
    t.string   "desc_nome"
    t.string   "desc_login"
    t.string   "desc_senha"
    t.datetime "data_inclusao"
    t.string   "desc_perfil"
    t.integer  "fd_empresas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fd_usuarios", ["fd_empresas_id"], name: "index_fd_usuarios_on_fd_empresas_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
