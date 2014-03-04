class Grouping < ActiveRecord::Base
  has_many :matches
  has_many :contributions, through: :matches
end
