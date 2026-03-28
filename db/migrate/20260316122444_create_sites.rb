class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.datetime :end_date
      t.datetime :start_date

      t.timestamps
    end
  end
end
