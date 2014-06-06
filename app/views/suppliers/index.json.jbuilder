json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :article_id, :address, :email, :name
  json.url supplier_url(supplier, format: :json)
end
