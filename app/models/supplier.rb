class Supplier < ActiveRecord::Base

  #relationships
  has_many :articles
end
