class Activity < ActiveRecord::Base
  attr_accessible :name
  belongs_to :record

end
