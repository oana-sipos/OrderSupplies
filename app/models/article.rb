class Article < ActiveRecord::Base
  belongs_to :supplier
  has_many :order_lines
end
