json.extract! subscription, :id, :user_id, :bot_id, :active, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)