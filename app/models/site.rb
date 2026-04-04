class Site < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :start_date, presence: true

  has_many :site_sections, dependent: :destroy
  accepts_nested_attributes_for :site_sections, allow_destroy: true
end
