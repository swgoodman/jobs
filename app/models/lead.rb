class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :company

  accepts_nested_attributes_for :company

  def company_attributes=(company_attributes)
    company = Company.find_or_create_by(company_attributes)
    self.company_id = company.id
  end
end
