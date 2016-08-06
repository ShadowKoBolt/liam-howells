class BlogPost < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  attachment :image

  acts_as_taggable

  validates :name, :slug, :date, presence: true

  def tag_list
    tags.collect(&:name).join(", ")
  end
end
