class Project < ActiveRecord::Base
  attr_accessible :name, :discription
  belongs_to :record

  before_destroy :check_dependency

  private

  def check_dependency
    records = Record.all
    records.each do |record|
      if record.project_id == self.id
        return false
      end
    end
  end

end
