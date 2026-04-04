class SiteSection < ApplicationRecord
  belongs_to :user
  belongs_to :site

  validates :section_name, presence: true

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true
end
