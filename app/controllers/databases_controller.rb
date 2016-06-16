require "csv"

class DatabasesController < ApplicationController
  # def index
  # end

  def submit
    csv_file = params[:file]
    CSV.foreach(csv_file.path) do |row|
      p row
    end
  end


end
