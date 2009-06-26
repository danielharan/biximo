class Timeline
  attr_accessor :date_range
  def initialize(day_start, day_end=day_start)
    @date_range = day_start .. day_end
  end
  
  def files
    @date_range.collect do |day|
      Dir.glob("#{RAILS_ROOT}/public/data/#{day.strftime('%Y_%m_%d')}*")
    end.flatten
  end
end
