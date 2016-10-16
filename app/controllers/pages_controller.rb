# frozen_string_literal: true
class PagesController < ApplicationController
  def show
    @page = Page.friendly.find(params[:id])
    render template: "pages/#{@page.type.underscore}"
  end
end
