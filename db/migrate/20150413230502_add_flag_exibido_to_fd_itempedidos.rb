class AddFlagExibidoToFdItempedidos < ActiveRecord::Migration
  def change
    add_column :fd_itempedidos, :flag_exibido, :boolean
  end
end
