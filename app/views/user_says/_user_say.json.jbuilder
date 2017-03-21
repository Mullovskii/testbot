json.extract! user_say, :id, :input, :lesson_id, :user_id, :bot_id, :created_at, :updated_at
json.url user_say_url(user_say, format: :json)