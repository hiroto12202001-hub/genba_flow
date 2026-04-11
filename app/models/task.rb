class Task < ApplicationRecord
  belongs_to :user
  belongs_to :site_section

  validates :title, presence: true
  validates :start_time, presence: true

  enum importance: { low_importance: 0, medium_importance: 1, high_importance: 2 }
  enum urgency: { low_urgency: 0, medium_urgency: 1, high_urgency: 2 }
  enum status: { pending: 0, in_progress: 1, completed: 2 }

  validates :importance, presence: true, inclusion: { in: importances.keys }
  validates :urgency, presence: true, inclusion: { in: urgencies.keys }
  validates :status, presence: true, inclusion: { in: statuses.keys }  
end
