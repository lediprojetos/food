class StaticPagesController < ApplicationController
before_action :requer_logon

def config2
end

def home		
 if params[:q] == "abrir"       
 	@fd_caixa = FdCaixa.new
    @fd_caixa.numr_contador = 0
    @fd_caixa.data_abertura = Time.now
    @fd_caixa.fd_empresa_id = user.fd_empresa_id
    @fd_caixa.save
 end

@caixa = FdCaixa.where(fd_empresa_id: user.fd_empresa_id, data_fechamento: nil)
    
if @caixa.first
   	@caixa_aberto = true
   else
   	@caixa_aberto = false
end

end 

def report

end


end
