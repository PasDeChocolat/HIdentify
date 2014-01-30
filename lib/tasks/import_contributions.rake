require 'pp'
require 'contribution_parser'
include ContributionParser

DATA_DIR="data"
DATA_FILE="#{DATA_DIR}/contributions.json"
EXPORT_DIR="#{DATA_DIR}/export"

def export_file_name_for year
  "#{EXPORT_DIR}/contribs_#{year}.json"
end

namespace :io do

  desc "Show first row of contributions."
  task :hash do
    p hash_contributions(DATA_FILE).first
  end

  desc "Show all top-level keys in contribution file."
  task :contributions_keys do
    p contribution_keys(DATA_FILE).to_a.sort
  end

end

namespace :import do

  desc "Import contributions."
  task :contributions => :environment do
    import_contributions DATA_FILE
  end

  desc "Import contributions for specified_year (IMP_YEAR=2013)."
  task :contrib_year => :environment do
    year = ENV["IMP_YEAR"] || "2013"
    import_contributions(export_file_name_for(year))
  end

end

namespace :export do

  desc "Export contributions for specified year (EXP_YEAR=2013)."
  task :contrib_year => :environment do
    year = ENV["EXP_YEAR"] || "2013"
    extract_json_for DATA_FILE, export_file_name_for(year), year
  end

end