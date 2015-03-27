class FdAdicionaisinclusosController < ApplicationController
  before_action :set_fd_adicionaisincluso, only: [:show, :edit, :update, :destroy]


  def insere_adicionais

    fd_adicionaisInclusos = FdAdicionaisincluso.where(:fd_itensadicional_id => params[:fd_itensadicional_id], :fd_itempedido_id => params[:fd_itempedido_id])

    fd_adicionaisInclusos = fd_adicionaisInclusos.first

    fd_itempedido = FdItempedido.find(params[:fd_itempedido_id])

    fd_itempedido.flag_itemadicional = true
    fd_itempedido.save

    if params[:numr_acao] == "0"

      if not fd_adicionaisInclusos.blank?
        fd_adicionaisInclusos.numr_quantidade = (fd_adicionaisInclusos.numr_quantidade - 1)
        fd_adicionaisInclusos.save

        if fd_adicionaisInclusos.numr_quantidade == 0
          fd_adicionaisInclusos.destroy

          fd_adicionaisInclusosGeral = FdAdicionaisincluso.where(:fd_itempedido_id => params[:fd_itempedido_id])

          if fd_adicionaisInclusosGeral.blank?
            fd_itempedido.flag_itemadicional = false
            fd_itempedido.save          
          end
          
        end
      else
      #Caso não exista nenhum item, ele adiciona um novo
        fd_adicionaisInclusos = FdAdicionaisincluso.new
        fd_adicionaisInclusos.fd_itensadicional_id = params[:fd_itensadicional_id]
        fd_adicionaisInclusos.fd_itempedido_id = params[:fd_itempedido_id]
        fd_adicionaisInclusos.numr_quantidade = -1
        fd_adicionaisInclusos.save

      end      

    else

      if not fd_adicionaisInclusos.blank?
        fd_adicionaisInclusos.numr_quantidade = (fd_adicionaisInclusos.numr_quantidade + 1)
        fd_adicionaisInclusos.save
        if fd_adicionaisInclusos.numr_quantidade == 0
          fd_adicionaisInclusos.destroy

          fd_adicionaisInclusosGeral = FdAdicionaisincluso.where(:fd_itempedido_id => params[:fd_itempedido_id])

          if fd_adicionaisInclusosGeral.blank?

            fd_itempedido.flag_itemadicional = false
            fd_itempedido.save          

          end

        end        
      else
      #Caso não exista nenhum item, ele adiciona um novo
        fd_adicionaisInclusos = FdAdicionaisincluso.new
        fd_adicionaisInclusos.fd_itensadicional_id = params[:fd_itensadicional_id]
        fd_adicionaisInclusos.fd_itempedido_id = params[:fd_itempedido_id]
        fd_adicionaisInclusos.numr_quantidade = 1
        fd_adicionaisInclusos.save

      end       


    end

    fd_adicionaisInclusos = FdAdicionaisincluso.where(:fd_itensadicional_id => params[:fd_itensadicional_id], :fd_itempedido_id => params[:fd_itempedido_id])

    json = fd_adicionaisInclusos.map {|item| {:fd_categoriaproduto_id => item.fd_itensadicional.fd_categoriaproduto_id, :id => item.id, :fd_itensadicional_id => item.fd_itensadicional_id, :fd_itempedido_id => item.fd_itempedido_id, :numr_quantidade => item.numr_quantidade}}
    render :json => json

  end  

  # GET /fd_adicionaisinclusos
  def index
    @fd_adicionaisinclusos = FdAdicionaisincluso.all
  end

  # GET /fd_adicionaisinclusos/1
  def show
  end

  # GET /fd_adicionaisinclusos/new
  def new
    @fd_adicionaisincluso = FdAdicionaisincluso.new
  end

  # GET /fd_adicionaisinclusos/1/edit
  def edit
  end

  # POST /fd_adicionaisinclusos
  def create
    @fd_adicionaisincluso = FdAdicionaisincluso.new(fd_adicionaisincluso_params)

    if @fd_adicionaisincluso.save
      redirect_to @fd_adicionaisincluso, notice: 'Fd adicionaisincluso was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fd_adicionaisinclusos/1
  def update
    if @fd_adicionaisincluso.update(fd_adicionaisincluso_params)
      redirect_to @fd_adicionaisincluso, notice: 'Fd adicionaisincluso was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fd_adicionaisinclusos/1
  def destroy
    @fd_adicionaisincluso.destroy
    redirect_to fd_adicionaisinclusos_url, notice: 'Fd adicionaisincluso was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fd_adicionaisincluso
      @fd_adicionaisincluso = FdAdicionaisincluso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fd_adicionaisincluso_params
      params.require(:fd_adicionaisincluso).permit(:fd_itensadicional_id, :fd_itempedido_id, :numr_quantidade)
    end
end
