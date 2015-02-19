#encoding: utf-8
class FdEmpresa < ActiveRecord::Base
  belongs_to :fd_endereco, :dependent => :destroy
  belongs_to :fd_categoriaempresa

  accepts_nested_attributes_for :fd_endereco, allow_destroy: true

  

  validates :fd_categoriaempresa_id, :presence => { :message => 'Escolha uma categoria' }  
  validates :desc_razaosocial, :presence => { :message => 'Digite a razão social' }
  validates :desc_nomefantasia, :presence => { :message => 'Digite o nome fantasia' }

end
