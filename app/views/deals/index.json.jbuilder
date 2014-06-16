json.array!(@deals) do |deal|
  json.extract! deal, :id, :title, :description
  json.url deal_url(deal, format: :json)
end
