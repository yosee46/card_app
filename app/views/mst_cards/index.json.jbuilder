json.array!(@mst_cards) do |mst_card|
  json.extract! mst_card, :card_name, :mana, :card_type, :poto, :text
  json.url mst_card_url(mst_card, format: :json)
end
