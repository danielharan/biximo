$: << "../app/models/"
require 'station'

class Map < Processing::App
  load_library 'video'
  import 'processing.video.MovieMaker'
  
  BOUNDS = {:left_lng => -73.62831115722656, :right_lng => -73.52531433105469, :top_lat => 45.5560111391413, :low_lat => 45.4838452797276}
  DAY    = "2009_06_30"

  attr_accessor :data_files, :img, :current_frame, :recording
  def setup
    @mm = MovieMaker.new(self, width, height, "biximo_#{DAY}.mov")
    @recording = true
    
    color_mode RGB, 1.0
    
    @font = create_font('Helvetica', 40)
    text_font @font
    
    smooth
    frame_rate 2
    @current_frame = 0

    @img  = load_image("montreal_gmap.gif")
    background @img
    
    @data_files = Dir.glob("./data/#{DAY}*marshalled")
  end
  
  def draw
    if @current_frame >= 288
      if @recording
        @mm.finish
        @recording = false
      end
      return
    end
    @mm.add_frame
    
    background @img
    
    fill 0, 0, 0, 1
    # a tick is 5 minutes
    hour, min = [$app.current_frame / 12, ($app.current_frame % 12) * 5].collect {|i| i.to_s.rjust(2, '0')}
    text("#{DAY.gsub('_', ' ')} #{hour}:#{min}", 270, 35);
    
    loaded = Marshal.load(IO.read(@data_files[@current_frame])).each do |station|
      AnimatedStation.new(station).draw
    end
    
    @current_frame += 1
  end
  
  class AnimatedStation
    def initialize(station)
      @station = station
    end
    
    def draw
      fill 0.7, 0, 0, @station.fill_ratio.to_f
      
      x, y = @station.convert_lat_lng_to_relative_position(BOUNDS)
      size = (Math.log(@station.size) / 1.94591014905531) * 12
      ellipse x * 600, y * 600, size, size
    end
  end
end

Map.new(:width => 600, :height => 600, :title => "Montreal Bixi Map")
