# frozen_string_literal: true
class BlogPost < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  attachment :image

  acts_as_taggable

  validates :name, :slug, :date, presence: true

  def tag_list
    tags.map(&:name).join(", ")
  end
end
