json.array!(@repair_requests) do |repair_request|
  json.extract! repair_request, :id, :open_date, :close_date, :request_details, :request_response, :submitter_id, :responder_id
  json.url repair_request_url(repair_request, format: :json)
end
