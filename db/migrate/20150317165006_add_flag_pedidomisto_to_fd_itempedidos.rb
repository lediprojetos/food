class AddFlagPedidomistoToFdItempedidos < ActiveRecord::Migration
  def change
    add_column :fd_itempedidos, :flag_pedidomisto, :boolean
  end
end
