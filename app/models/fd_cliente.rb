class FdCliente < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :fd_endereco, :dependent => :destroy


 accepts_nested_attributes_for :fd_endereco, allow_destroy: true
end
