class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags
  
  validates :name, presence: true
  validates_uniqueness_of :name
end
