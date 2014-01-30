class Contribution < ActiveRecord::Base
  belongs_to :contribution_address

  class << self

    def flatten_raw data={}
      data['date'] = Time.zone.parse data['date']
      data['amount'] = data['amount'].to_i
      data['aggregate'] = data['aggregate'].to_i

      data.except! 'mapping_address'
      return data
    end

    def create_with_raw data={}
      # set this aside, we're mutating data
      mapping_address = data["mapping_address"]

      # flatten so we can use the hash as the create arg
      flat = flatten_raw data
      contrib = create flat
      if mapping_address
        contrib.contribution_address = ContributionAddress.find_or_create_with mapping_address
        unless contrib.save
          raise "Error! Unable to associate mapping address: #{mapping_address}\n to contribution: #{contrib}"
        end
      end
      return contrib
    end

  end


  # "inoutstate" : "HI ",
  # "aggregate" : "200",
  # "range" : "0-1000",
  # "zip_code" : "96826-2097",
  # "contributor_type" : "Noncandidate Committee",
  # "candidate_name" : "Yamashita, Kyle",
  # "state" : "HI",
  # "date" : "2012-03-26T06:41:20",
  # "party" : "Democrat",
  # "reg_no" : "CC10232",
  # "city" : "HONOLULU",
  # "amount" : "100",
  # "mapping_address" : {
  #   "needs_recoding" : false,
  #   "longitude" : "-157.83488031199974",
  #   "latitude" : "21.29661676200044",
  #   "human_address" : "{\"address\":\"1654 KING STREET\",\"city\":\"HONOLULU\",\"state\":\"HI\",\"zip\":\"96826-2097\"}"
  # },
  # "non_monetary_yes_or_no" : "N",
  # "district" : "12",
  # "office" : "House",
  # "street_address_1" : "1654 S. KING STREET",
  # "contributor_name" : "HCUL STATE PAC",
  # "election_period" : "2010-2012"

end
