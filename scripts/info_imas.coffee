# Description:
#   Example scripts for you to examine and try out.
#

module.exports = (robot) ->
  robot.respond /imas( me)? (.*)/i,(msg) ->
    url = "http://api.yagi2.com/imas/character/list?id=" + msg.match[2]
    
    msg.http(url)
      .get() (err, res, body) ->
        text = JSON.parse(body)
        
        res = text[0]["type"] + "プロダクション所属の" + text[0]["character_name"] + "(" + text[0]["character_name_ruby"] + ")ちゃん！\n誕生日は" + text[0]["character_birth_month"] + "月" + text[0]["character_birth_day"] + "日で，血液型は" + text[0]["character_blood_type"] + "ね！\nパーソナルカラーは" + text[0]["character_color"] + "で，CVは" + text[0]["cv_name"] + "(" + text[0]["cv_name_ruby"] + ")さんね！ ニックネームは" + text[0]["cv_nickname"] + "よ！" 
        
        msg.send res