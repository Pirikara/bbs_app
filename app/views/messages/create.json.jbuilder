json.user_id @message.user.id
json.user_name @message.user.name
json.created_at time_ago_in_words(@message.created_at)
json.content simple_format(@message.content)