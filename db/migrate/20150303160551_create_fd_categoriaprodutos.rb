#encoding: utf-8
class CreateFdCategoriaprodutos < ActiveRecord::Migration
  def change
    create_table :fd_categoriaprodutos do |t|
      t.string :desc_categoria
      t.boolean :flag_global
      t.integer :father_id, :integer, :references => :fd_categoriaprodutos 
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true      
      t.timestamps
    end
	  
    FdCategoriaproduto.create(:desc_categoria => 'Serviços', :flag_global => true)
    FdCategoriaproduto.create(:desc_categoria => 'Combos', :flag_global => true)  
  
  end
end
