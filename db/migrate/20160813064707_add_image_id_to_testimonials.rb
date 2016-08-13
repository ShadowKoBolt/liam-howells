class AddImageIdToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :image_id, :string
  end
end
