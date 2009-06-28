class Animation
  attr_accessor :date_range
  def initialize(day_start, day_end=day_start)
    @date_range = day_start .. day_end
  end
  
  def files
    @date_range.collect do |day|
      Dir.glob("#{RAILS_ROOT}/public/data/#{day.strftime('%Y_%m_%d')}*")
    end.flatten
  end
  
  def stations
    frames = files.sort.collect {|f| Kml.stations(IO.read(f))}
    
    stations_hash = frames.flatten.inject({}) do |hash,station|
      hash[station.name] = station
      hash
    end
    
    frames.each do |stations|
      stations.each do |station|
        stations_hash[station.name].timeline << station.fill_ratio
      end
    end
    
    stations_hash.values
  end
end
