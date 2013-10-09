class AddManufactuerIdToAutomobiles < ActiveRecord::Migration
  def change
    add_column :automobiles, :manufactuer_id, :integer
  end
end
