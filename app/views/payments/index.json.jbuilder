json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :ip_address, :first_name, :last_name, :expires_on
  json.url payment_url(payment, format: :json)
end
