# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_if_required

  protected

  def authenticate_if_required
    return unless ENV["USERNAME"].present? && ENV["PASSWORD"].present?
    authenticate_or_request_with_http_basic Rails.env do |username, password|
      username == ENV["USERNAME"] && password == ENV["PASSWORD"]
    end
  end
end
