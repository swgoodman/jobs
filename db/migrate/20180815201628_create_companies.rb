class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :description
      t.string :logo
      t.string :city
      t.string :state
    end
  end
end
