json.extract! event, :id, :bot_id, :lesson_id, :name, :place, :description, :organizer, :free, :price, :link, :photo, :token, :created_at, :updated_at
json.url event_url(event, format: :json)