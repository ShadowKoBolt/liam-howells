class BlogPost < ActiveRecord::Base
  attachment :image
  acts_as_taggable

  def tag_list
    tags.collect(&:name).join(", ")
  end
end
