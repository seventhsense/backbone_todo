class Task < ActiveRecord::Base
  attr_accessible :content, :done
  validates :content,:presence => true
end
