class CreateFdItensadicionals < ActiveRecord::Migration
  def change
    create_table :fd_itensadicionals do |t|
      t.references :fd_item, index: true
      t.references :fd_categoriaproduto, index: true
      t.decimal :valr_item
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true
      t.timestamps
    end
  end
end
