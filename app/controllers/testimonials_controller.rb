class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.order(:position)
  end
end
