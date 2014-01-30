require 'json'
require 'set'

module ContributionParser

  def hash_contributions data_file
    JSON.parse(File.read(data_file))
  end

  def import_contributions data_file
    hash_contributions(data_file).each_with_index do |contrib, i|
      # break if i > 1000
      Contribution.create_with_raw contrib
    end
    puts "Done importing: #{data_file}"
  end

  def contribution_keys data_file
    hash_contributions(data_file).inject(Set.new) do |keys, contrib|
      keys.merge contrib.keys
    end
  end

  def extract_json_for input_data_file, output_data_file, year=2013
    filtered = []
    hash_contributions(input_data_file).each do |contrib|
      filtered << contrib if contrib['date'] =~ /^#{year}-/
      
    end
    File.open(output_data_file, "w") do |file|
      file.write(filtered.to_json) 
    end
    puts "Done exporting: #{output_data_file}"
  end

end