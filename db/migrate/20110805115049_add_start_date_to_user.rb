class AddStartDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :started_on, :date
  end
end
