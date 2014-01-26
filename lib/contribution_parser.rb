require 'json'

module ContributionParser

  def hash_contributions data_file
    JSON.parse(File.read(data_file));
  end

  def import_contributions data_file
    hash_contributions(data_file).each_with_index do |contrib, i|
      # break if i > 1000
      Contribution.create_with_raw contrib
    end
  end

end