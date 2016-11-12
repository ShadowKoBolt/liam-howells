class Package < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  validates :name, :price, :description, :position, presence: true

  default_scope { order(:position) }

  def price_f
    number_to_currency (price.to_f / 100.to_f), unit: ""
  end

  def price_f=(value)
    self.price = (value.to_f * 100.to_f).to_i
  end
end
