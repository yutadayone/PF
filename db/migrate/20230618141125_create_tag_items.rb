class CreateTagItems < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_items do |t|

      t.timestamps
      t.integer :review_id, null: false
      t.integer :tag_id, null: false
    end
  end
end
