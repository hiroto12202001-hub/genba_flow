class SiteMember < ApplicationRecord
  belongs_to :user
  belongs_to :site

  enum role: { admin: 0, member: 1 }
end
