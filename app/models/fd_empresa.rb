class FdEmpresa < ActiveRecord::Base
  belongs_to :fd_endereco
  belongs_to :fd_categoriaempresa
end
