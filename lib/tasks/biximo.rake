require "#{RAILS_ROOT}/app/models/kml"
require "#{RAILS_ROOT}/app/models/station"
require 'rubygems'
require 'tzinfo'

namespace :biximo do
  desc 'convert kml in a format easier for ruby-processing to handle'
  task :marshal_kml do
    tz, format = TZInfo::Timezone.get('America/Montreal'), "%Y_%m_%d_%H_%M"
    
    Dir.glob("#{RAILS_ROOT}/processing/data/*kml").each do |f|
      utc_time = DateTime.strptime(File.basename(f, ".kml")[0..15], format)
      new_name = File.join(File.dirname(f), tz.utc_to_local(utc_time).strftime(format) + ".marshalled")
      
      next if File.exists?(new_name)
      
      puts "processing #{f}"
      
      stations = Kml.stations(IO.read(f))
      
      File.open(new_name, "w+") do |file|
        file.puts Marshal.dump(stations)
      end
    end
  end
end