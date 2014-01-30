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

end