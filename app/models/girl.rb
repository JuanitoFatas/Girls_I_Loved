class Girl < ActiveRecord::Base
  attr_accessible :name, :number
  validates :name, :presence => true
  validates :number, :presence => true, 
  									 :uniqueness => true, 
  									 :numericality => { :greater_than => 1 }
end