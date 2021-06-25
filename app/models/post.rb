class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tag_hash)
    if tag_hash[:name].present?
      tag = Tag.find_or_create_by(tag_hash)
      self.post_tags.build(tag_id: tag.id)
      self.save
    else
      false
    end

  end

end
