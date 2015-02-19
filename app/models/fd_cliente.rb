class FdCliente < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :fd_endereco, :dependent => :destroy


 accepts_nested_attributes_for :fd_endereco, allow_destroy: true

 SEXO = %w[MASCULINO FEMININO]

 validates :nome_cliente, :presence => { :message => 'Digite o nome' }  

end
