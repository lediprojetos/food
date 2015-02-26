class FdCargo < ActiveRecord::Base
  belongs_to :fd_empresa
  belongs_to :exclusao, :class_name => "FdUsuario", :foreign_key => "user_exclusao"
  
end
