# frozen_string_literal: true
class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.order(:position)
  end
end
