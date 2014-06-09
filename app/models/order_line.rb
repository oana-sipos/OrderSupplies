class OrderLine < ActiveRecord::Base

  #relationships
  belongs_to :order
  belongs_to :article

  validates :article_id, presence: true
end
