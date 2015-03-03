class CreateFdStatuses < ActiveRecord::Migration
  def change
    create_table :fd_statuses do |t|
      t.string :nome_status
      t.string :desc_status

      t.timestamps
    end
  end
end
