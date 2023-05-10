class RemoveTelephonNumberFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :telephon_number, :string
  end
end
