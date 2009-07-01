require "#{RAILS_ROOT}/app/models/kml"
require "#{RAILS_ROOT}/app/models/station"

namespace :biximo do
  task :marshal_kml do
    Dir.glob("#{RAILS_ROOT}/processing/data/*kml").each do |f|
      next if File.exists?(f.gsub("kml", "marshalled"))
      
      puts "processing #{f}"
      
      stations = Kml.stations(IO.read(f))
      
      File.open(f.gsub("kml", "marshalled"), "w+") do |file|
        file.puts Marshal.dump(stations)
      end
      
    end
  end
end