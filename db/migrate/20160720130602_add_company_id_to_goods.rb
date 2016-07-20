class AddCompanyIdToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :company_id, :integer
  end
end
