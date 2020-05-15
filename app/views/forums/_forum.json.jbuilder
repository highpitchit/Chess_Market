json.extract! forum, :id, :date, :title, :content, :user_id, :created_at, :updated_at
json.url forum_url(forum, format: :json)
