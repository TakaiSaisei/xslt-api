# frozen_string_literal: true

class XmlController < ApplicationController
  before_action :parse_params, only: :index
  def index
    @result = automorphs(@limit).map { |element| { x: element, xsqr: element**2 } }
    respond_to do |format|
      format.html { render }
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def parse_params
    @limit = params[:limit].to_i
  end

  private

  def automorphs(num)
    array = (1..num).select { |element| [1, 5, 6].member?(element % 10) }
    array.delete_if { |element| !(element**2).to_s.end_with?(element.to_s) }
  end
end
