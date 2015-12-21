json.array!(@status_times) do |status_time|
  json.extract! status_time, :id, :status, :location, :notes, :user_id, :trip_id
  json.url status_time_url(status_time, format: :json)
end
