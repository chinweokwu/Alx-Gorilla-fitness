class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :bodypart
      t.date :date
      t.integer :caloriesburnt

      t.timestamps
    end
  end
end
