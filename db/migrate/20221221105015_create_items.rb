class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,               null: false
      t.text       :text,               null: false
      t.integer    :genre_id,           null: false
      t.integer    :item_condition_id,  null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :delivery_time_id,   null: false
      t.integer    :item_price,         null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
