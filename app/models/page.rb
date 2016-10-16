# frozen_string_literal: true
class Page < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :slug, presence: true
end
