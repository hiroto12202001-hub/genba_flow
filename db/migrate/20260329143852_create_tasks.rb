class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site_section, null: false, foreign_key: true
      t.integer :importance, null: false, default: 0
      t.integer :urgency, null: false, default: 0
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.integer :status, null: false, default: 0
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
