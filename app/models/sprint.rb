class Sprint < ActiveRecord::Base
  attr_accessible :name, :startDate, :endDate, :active
end
