class CreateShoppePromotions < ActiveRecord::Migration
  def change
    create_table :shoppe_promotions do |t|
      t.string :name
      t.string :code
      t.date :start_date
      t.date :expiry_date
      t.date :used_on_date
      t.integer :user_id
      t.text :reason
      t.integer :value
      t.integer :usage_limit, default: 1
    end
  end
end
