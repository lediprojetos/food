class FdCategoriaproduto < ActiveRecord::Base
	
  has_many :children, :class_name => "FdCategoriaproduto", :foreign_key => "father_id"
  belongs_to :father, :class_name => "FdCategoriaproduto", :foreign_key => "father_id"	

  belongs_to :inclusao, :class_name => "FdUsuario", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "FdUsuario", :foreign_key => "user_exclusao"  
end
