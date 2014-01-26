require 'pp'
require 'contribution_parser'
include ContributionParser

DATA_DIR="data"
DATA_FILE="#{DATA_DIR}/contributions.json"

namespace :io do

  desc "Show first row of contributions."
  task :hash do
    p hash_contributions(DATA_FILE).first
  end

end

namespace :import do

  desc "Import contributions."
  task :contributions => :environment do
    import_contributions DATA_FILE
  end

end