class AddflagGlobalToFdVariacao < ActiveRecord::Migration
  def change
    add_column :fd_variacaos, :flag_global, :boolean
  end
end
