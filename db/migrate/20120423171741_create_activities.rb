class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :name
      t.timestamps
    end

            Activity.create :name => "Self Development"
            Activity.create :name => "Working Time"
            Activity.create :name => "Extra Time"
            Activity.create :name => "Team Time"

  end
  def self.down
  drop_table :activities
end
end



