class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :worker_id
      t.date :first_day
      t.date :last_day
      t.integer :duration
      t.string :state
      t.text :comment

      t.timestamps
    end
  end
end
