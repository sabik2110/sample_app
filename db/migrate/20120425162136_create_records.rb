class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :project_id
      t.integer :reported_minutes
      t.date :added_time
      t.string :discription

    end
  end
  def self.down
    drop_table :records
  end
end
