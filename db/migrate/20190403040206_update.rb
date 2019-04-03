class Update < ActiveRecord::Migration
  def change
    change_column :foods, :ghg_amount, :float
  end
end
