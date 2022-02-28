class RenameCompanyOrderToCompanyNumber < ActiveRecord::Migration[7.0]
  def change
    rename_column :companies, :company_order, :company_number
  end
end
