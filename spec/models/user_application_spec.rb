# frozen_string_literal: true
require "rails_helper"

RSpec.describe UserApplication, type: :model do
  it { should validate_uniqueness_of(:uuid) }
end
