class Match < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :contribution
  has_many :votes
end
