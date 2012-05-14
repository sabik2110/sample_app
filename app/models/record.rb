class Record < ActiveRecord::Base
  has_many :projects
  has_many :users
  has_many :activities

  attr_accessor :hours, :minutes, :project, :activity, :user
  attr_accessible :hours, :minutes, :project_id, :activity_id, :discription

  before_save :convert_to_reported_minutes
  after_find :reported_minutes_to_hours, :reported_minutes_to_minutes

  private

  def convert_to_reported_minutes
    self.reported_minutes = self.hours.to_i*60+self.minutes.to_i
  end

  def reported_minutes_to_hours
     self.hours = self.reported_minutes.to_i/60
    end

    def reported_minutes_to_minutes
      self.minutes = self.reported_minutes.to_i%60
    end

end

