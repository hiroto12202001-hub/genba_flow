class Task < ApplicationRecord
  belongs_to :user
  belongs_to :site_section

  validates :title, presence: true
  validates :start_time, presence: true
end
