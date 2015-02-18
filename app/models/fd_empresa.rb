class FdEmpresa < ActiveRecord::Base
  belongs_to :fd_endereco, :dependent => :destroy
  belongs_to :fd_categoriaempresa

  accepts_nested_attributes_for :fd_endereco, allow_destroy: true

end
