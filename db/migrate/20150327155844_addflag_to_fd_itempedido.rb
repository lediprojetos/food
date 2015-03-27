class AddflagToFdItempedido < ActiveRecord::Migration
  def change
  	 add_column :fd_itempedidos, :flag_itemalterado, :boolean
  	 add_column :fd_itempedidos, :flag_itemadicional, :boolean
  end
end
