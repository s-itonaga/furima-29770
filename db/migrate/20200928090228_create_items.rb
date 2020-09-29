class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.text :comment,           null: false
      t.integer :category,       null: false
      t.integer :delivery_fee,   null: false
      t.integer :prefectures,    null: false
      t.integer :delivery_days,  null: false
      t.integer :price,          null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
