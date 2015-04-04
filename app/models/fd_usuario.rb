#encoding: utf-8
class FdUsuario < ActiveRecord::Base
  belongs_to :fd_empresa

#Presence
	
	validates :desc_nome, :presence => { :message => 'Digite um nome para a pessoa.' }
	validates :desc_login, :presence => { :message => 'Digite o nome de usuário.' }
	validates :desc_confirmalogin, :presence => { :message => 'Digite a confirmação do usuário.' }
	validates :desc_senha, :presence => { :message => 'Digite a senha.' }
	validates :desc_confirmasenha, :presence => { :message => 'Digite a confirmação da senha.' }

#iguality
	validate :check_email_and_confirmation
	validate :check_senha_and_confirmation
	#validate :busca_email_existente


def busca_email_existente
	errors.add(:desc_login, "Usuário já está sendo utilizado.") if FdUsuario.find_by_desc_login(self.desc_login)
end		

def check_email_and_confirmation
  	errors.add(:desc_confirmalogin, "O nome de usuario não foi confirmado corretamente.") if  self.desc_login != self.desc_confirmalogin
end

def check_senha_and_confirmation
  	errors.add(:desc_confirmasenha, "A senha não foi confirmado corretamente.") if self.desc_senha != self.desc_confirmasenha
end


def desc_confirmasenha
  @desc_confirmasenha
end

# setter
def desc_confirmasenha=(val)
  @desc_confirmasenha = val
end 

def desc_confirmalogin
  @desc_confirmalogin
end

# setter
def desc_confirmalogin=(val)
  @desc_confirmalogin = val
end  

end
