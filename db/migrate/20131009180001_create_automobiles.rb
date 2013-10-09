class CreateAutomobiles < ActiveRecord::Migration
  def change
    create_table :automobiles do |t|
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.text :description

      t.timestamps
    end
  end
end
