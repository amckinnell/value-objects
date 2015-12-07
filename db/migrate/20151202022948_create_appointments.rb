class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :description, null: false
      t.date :date, null: false
      t.time :start,  null: false
      t.time :end,  null: false

      t.timestamps null: false
    end
  end
end
