class RemoveCompanyAndCurrencyFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :company
  	remove_column :users, :accounting_currency
  end
end
