class Order < ActiveRecord::Base

  #relationships
  belongs_to :user
  has_many :order_lines, :dependent => :destroy 
end
