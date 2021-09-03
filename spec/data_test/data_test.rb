class DataTest
  def self.get_scenarios_file_paths
    scenarios = {}
    current_path = File.dirname(__FILE__)
    puts current_path
    4.times do |i|
      json_file_name = "scenario_#{i}"
      scenarios[json_file_name] = "#{current_path}/#{json_file_name}.json"
    end
    scenarios
  end
end
