class FdCategoriaempresa < ActiveRecord::Base

  validates :nome_categoria, :presence => { :message => 'Digite uma categoria' }

end
