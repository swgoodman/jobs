class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :status
      t.string :point_person
      t.string :phone_number
      t.string :email
      t.string :position
      t.datetime :created_on
      t.datetime :applied_on
    end
  end
end
