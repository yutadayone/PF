class AddCustomerIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :customer, foreign_key: true
  end
end
