class PagesController < ApplicationController
  layout false
  
  def home
  end
  
  def animation
    @t = Timeline.new(Date.civil(2009,06,24))
  end
end
