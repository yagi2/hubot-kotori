# Description
#   A Hubot script that respond imas character's information and image.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot info me アイドル名
#
# Author:
#   Yagi2 <mail@yagi2.com>
#
module.exports = (robot) ->
  robot.respond /imas info( me)? (.*)/i,(msg) ->
    
    imas_api_query = c_name: msg.match[2]
    msg.http('http://api.yagi2.com/imas/character/list')
      .query(imas_api_query)
      .get() (err, res, body) ->
        text = JSON.parse(body)
        
        mes = text[0]["type"] + "所属の" + text[0]["ch_name"] + "(" + text[0]["ch_name_ruby"] + ")ちゃん！\n誕生日は" + text[0]["ch_birth_month"] + "月" + text[0]["ch_birth_day"] + "日で，血液型は" + text[0]["ch_blood_type"] + "ね！\nパーソナルカラーは" + text[0]["ch_color"] + "で，CVは" + text[0]["cv_name"] + "(" + text[0]["cv_name_ruby"] + ")さんね！ ニックネームは" + text[0]["cv_nickname"] + "よ！" 
        
        msg.send mes
    
    image_query = v: '1.0', rsz: '8', q: msg.match[2], safe: 'active'
    msg.http('http://ajax.googleapis.com/ajax/services/search/images')
      .query(image_query)
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.responseData?.results        
        
        image = msg.random images
        
        msg.send image.unescapedUrl