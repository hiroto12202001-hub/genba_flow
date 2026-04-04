class CreateSiteSections < ActiveRecord::Migration[6.1]
  def change
    create_table :site_sections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.string :section_name

      t.timestamps
    end
  end
end
