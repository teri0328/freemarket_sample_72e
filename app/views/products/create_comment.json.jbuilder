json.comment  br(@comment.comment)
json.time     @comment.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
json.name     current_user.nickname
json.id       current_user.id