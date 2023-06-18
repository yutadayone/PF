class CreateReviews < ActiveRecord::Migration[6.1]
  #複数形・小文字
  def change
    create_table :reviews do |t|

      t.timestamps
      t.text :introduction
      t.string :star, null: false
    end
  end
end
