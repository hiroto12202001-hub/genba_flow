class Site < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :start_date, presence: true

  has_many :site_sections, dependent: :destroy
  accepts_nested_attributes_for :site_sections, allow_destroy: true

  has_many :site_members, dependent: :destroy
  has_many :members, through: :site_members, source: :user

  after_create :add_site_member

  private

  def add_site_member
    self.site_members.create!(user: user, role: :admin)
  end
end
