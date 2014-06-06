json.array!(@articles) do |article|
  json.extract! article, :id, :article_code, :supplier_id, :description, :price_per_unit, :unit
  json.url article_url(article, format: :json)
end
