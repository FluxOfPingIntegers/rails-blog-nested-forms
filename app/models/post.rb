class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tag_hash)
    if tag_hash.class == ActiveSupport::HashWithIndifferentAccess && Tag.new(tag_hash).valid?
      tag = Tag.find_or_create_by(tag_hash)
      self.save
      PostTag.create(post_id: self.id, tag_id: tag.id)
    else
      false
    end
  end

end
