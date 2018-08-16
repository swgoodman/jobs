class Company < ApplicationRecord
  has_many :leads
  has_many :users, through: :leads
end
