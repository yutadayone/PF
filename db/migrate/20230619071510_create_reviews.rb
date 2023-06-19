class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.text :introduction
      t.string :star, null: false
    end
  end
end
