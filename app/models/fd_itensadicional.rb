class FdItensadicional < ActiveRecord::Base
  belongs_to :fd_item
  belongs_to :fd_categoriaproduto
  belongs_to :inclusao, :class_name => "FdUsuario", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "FdUsuario", :foreign_key => "user_exclusao"
end
