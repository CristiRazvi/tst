class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.integer :company_order
      t.string :title

      t.timestamps
    end
  end
end
