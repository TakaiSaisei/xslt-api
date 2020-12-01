# frozen_string_literal: true

class XmlController < ApplicationController
  before_action :parse_params, only: :index
  def index
    limit = params[:limit].to_i
    array = (1..limit).select { |num| [1, 5, 6].member?(num % 10) }
    array.delete_if { |element| !(element**2).to_s.end_with?(element.to_s) }
    @result = array.map { |element| { x: element, xsqr: element**2 } }
    respond_to do |format|
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def parse_params
    @limit = params[:limit]
  end
end
