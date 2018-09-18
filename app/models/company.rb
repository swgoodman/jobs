class Company < ApplicationRecord
  has_many :leads
  has_many :users, through: :leads

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
