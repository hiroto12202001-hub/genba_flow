class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sites, dependent: :destroy

  has_many :site_members, dependent: :destroy
  has_many :joined_sites, through: :site_members, source: :site

  def admin?(site)
    site_member = site.site_members.find_by(user: self)
    site_member && site_member.role.to_sym == :admin
  end

  def editor?(site)
    site_member = site.site_members.find_by(user: self)
    site_member && site_member.role.to_sym == :editor
  end
  
  def owner?(site)
    self == site.user
  end

  def admin_sites
    Site.joins(:site_members).where(site_members: { user_id: id, role: :admin })
  end

  def editor_sites
    Site.joins(:site_members).where(site_members: { user_id: id, role: :editor })
  end
end
