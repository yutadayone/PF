class CreateTagItems < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_items do |t|

      t.timestamps
    end
  end
end
