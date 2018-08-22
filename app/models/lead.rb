class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :position, presence: true
  validates :phone_number, numericality: true

  accepts_nested_attributes_for :company

  def company_attributes=(company_attributes)
    company = Company.find_or_create_by(name: company_attributes[:name])
    company.update(company_attributes)
    self.company_id = company.id
  end

  OPTIONS = [
    {:name => 'Cold'},
    {:name => 'Warm'}
      ]

  def self.options
    OPTIONS.map{ |option| [option[:name], option[:name]] }
  end

end
