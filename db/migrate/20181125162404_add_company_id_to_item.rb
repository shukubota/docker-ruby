class AddCompanyIdToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :company_id, :integer
  end
end
