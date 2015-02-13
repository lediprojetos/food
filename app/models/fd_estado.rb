class FdEstado < ActiveRecord::Base
	has_many :fd_cidade, :dependent => :destroy
end
