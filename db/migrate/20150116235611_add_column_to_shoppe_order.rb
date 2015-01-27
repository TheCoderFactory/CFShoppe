class AddColumnToShoppeOrder < ActiveRecord::Migration
  def change
    add_column :shoppe_orders, :promotion_id, :integer
  end
end
