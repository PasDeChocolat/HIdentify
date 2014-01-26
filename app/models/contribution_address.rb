class ContributionAddress < ActiveRecord::Base
  has_many :contributions

  class << self

    def flatten_mapping_address data={}
      data.merge!(JSON.parse(data["human_address"]))

      data["longitude"] = BigDecimal.new(data["longitude"])
      data["latitude"]  = BigDecimal.new(data["latitude"])

      data.except! 'needs_recoding'
      data.except! 'human_address'

      return data
    end

    def find_or_create_with mapping_address={}
      flat = flatten_mapping_address mapping_address
      match = where flat
      addr = nil
      if match.blank?
        addr = create flat
      elsif match.size > 1
        raise "Error! Found too many (#{match.size}) matching addresses: #{mapping_address}"
      else
        addr = match.first
      end

      return addr
    end

  end
end
