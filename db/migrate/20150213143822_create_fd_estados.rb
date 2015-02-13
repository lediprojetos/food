#encoding: utf-8
class CreateFdEstados < ActiveRecord::Migration
  def change
    create_table :fd_estados do |t|
      t.string :nome_estado
      t.string :sigl_estado

      t.timestamps
   end

    FdEstado.create(:nome_estado => 'Acre', :sigl_estado =>  'AC')
    FdEstado.create(:nome_estado => 'Alagoas', :sigl_estado => 'AL')
    FdEstado.create(:nome_estado => 'Amazonas', :sigl_estado => 'AM')
    FdEstado.create(:nome_estado => 'Amapá', :sigl_estado => 'AP')
    FdEstado.create(:nome_estado => 'Bahia', :sigl_estado => 'BA')
    FdEstado.create(:nome_estado => 'Ceará', :sigl_estado => 'CE')
    FdEstado.create(:nome_estado => 'Distrito Federal', :sigl_estado => 'DF')
    FdEstado.create(:nome_estado => 'Espírito Santo', :sigl_estado => 'ES')
    FdEstado.create(:nome_estado => 'Goiás',:sigl_estado => 'GO')
    FdEstado.create(:nome_estado => 'Maranhão', :sigl_estado => 'MA')
    FdEstado.create(:nome_estado => 'Minas Gerais', :sigl_estado => 'MG')
    FdEstado.create(:nome_estado => 'Mato Grosso do Sul', :sigl_estado => 'MS')
    FdEstado.create(:nome_estado => 'Mato Grosso', :sigl_estado => 'MT')
    FdEstado.create(:nome_estado => 'Pará', :sigl_estado => 'PA')
    FdEstado.create(:nome_estado => 'Paraíba', :sigl_estado => 'PB')
    FdEstado.create(:nome_estado => 'Pernambuco', :sigl_estado => 'PE')
    FdEstado.create(:nome_estado => 'Piauí', :sigl_estado => 'PI')
    FdEstado.create(:nome_estado => 'Paraná', :sigl_estado => 'PR')
    FdEstado.create(:nome_estado => 'Rio de Janeiro', :sigl_estado => 'RJ')
    FdEstado.create(:nome_estado => 'Rio Grande do Norte', :sigl_estado => 'RN')
    FdEstado.create(:nome_estado => 'Rondônia', :sigl_estado => 'RO')
    FdEstado.create(:nome_estado => 'Roraima', :sigl_estado => 'RR')
    FdEstado.create(:nome_estado => 'Rio Grande do Sul', :sigl_estado => 'RS')
    FdEstado.create(:nome_estado => 'Santa Catarina', :sigl_estado => 'SC')
    FdEstado.create(:nome_estado => 'Sergipe', :sigl_estado => 'SE')
    FdEstado.create(:nome_estado => 'São Paulo', :sigl_estado => 'SP')
    FdEstado.create(:nome_estado => 'Tocantins', :sigl_estado => 'TO')  
  end
end
