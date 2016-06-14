class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :company_id
      t.string :name
      t.string :site
      t.string :city
      t.string :phone

      t.timestamps null: false
    end
  end
end
