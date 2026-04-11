class CreateSiteMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :site_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.integer :role, default: 1, null: false

      t.timestamps
      t.index [:user_id, :site_id], unique: true
    end
  end
end
