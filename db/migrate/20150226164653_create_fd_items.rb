class CreateFdItems < ActiveRecord::Migration
  def change
    create_table :fd_items do |t|
      t.string :desc_item
      t.datetime :data_exclusao
      t.references :fd_empresa, index: true
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true
  
      t.timestamps
    end
  end
end
