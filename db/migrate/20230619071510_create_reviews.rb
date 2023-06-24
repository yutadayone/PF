class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.text :introduction
      t.string :star, null: false
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
    end
  end
end
