json.extract! post, :id, :user_id, :bot_id, :lesson_id, :title, :body, :link, :photo, :created_at, :updated_at
json.url post_url(post, format: :json)