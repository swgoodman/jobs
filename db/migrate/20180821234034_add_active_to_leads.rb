class AddActiveToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :active, :boolean
  end
end
