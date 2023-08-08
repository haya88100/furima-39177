class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :memo, null: false
      t.integer :status_id, null: false
      t.integer :chage_bearer_id, null: false
      t.integer :shopping_area_id, null: false
      t.integer :delivary_day_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
