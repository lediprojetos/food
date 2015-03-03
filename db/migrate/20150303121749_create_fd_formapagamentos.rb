class CreateFdFormapagamentos < ActiveRecord::Migration
  def change
    create_table :fd_formapagamentos do |t|
      t.string :desc_formapagamento

      t.timestamps
    end
  end
end
