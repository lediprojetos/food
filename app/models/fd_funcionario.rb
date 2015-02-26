class FdFuncionario < ActiveRecord::Base
  belongs_to :fd_cargo
  belongs_to :fd_endereco
  belongs_to :fd_empresa
  belongs_to :inclusao, :class_name => "FdUsuario", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "FdUsuario", :foreign_key => "user_exclusao"
end
