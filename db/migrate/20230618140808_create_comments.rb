class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :introduction, null: false
      t.integer :customer_id, null: false
      t.integer :review_id, null: false
    end
  end
end
