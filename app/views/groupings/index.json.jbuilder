json.array!(@groupings) do |grouping|
  json.extract! grouping, :id, :name
  json.url grouping_url(grouping, format: :json)
end
