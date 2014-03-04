class Match < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :contribution
end
