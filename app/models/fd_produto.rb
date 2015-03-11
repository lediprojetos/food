class FdProduto < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :fd_categoriaproduto
  belongs_to :inclusao, :class_name => "FdUsuario", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "FdUsuario", :foreign_key => "user_exclusao"
  has_many :fd_pedidocombo
  has_many :fd_produtotrocacombos
end
