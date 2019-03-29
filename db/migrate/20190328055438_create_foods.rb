class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :ghg_amount
      t.string :source
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
