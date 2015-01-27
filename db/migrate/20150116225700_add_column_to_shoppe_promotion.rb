class AddColumnToShoppePromotion < ActiveRecord::Migration
  def change
    add_column :shoppe_promotions, :number_used, :integer
  end
end
