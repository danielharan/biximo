class KmlController < ApplicationController
  def bixi_stations
    @stations = Parser.fetch
  end
end
