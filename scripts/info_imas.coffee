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
  robot.respond /imas char( me)? (.*)/i,(msg) ->
    
    imas_api_query = ch_name: msg.match[2]
    msg.http('http://api.yagi2.com/imas/character/list')
      .query(imas_api_query)
      .get() (err, res, body) ->
        text = JSON.parse(body)
        if text["result"] isnt 0
          if text[0]["cv_name"] isnt null
            msg.send text[0]["type"] + "所属の" + text[0]["ch_name"] + "(" + text[0]["ch_name_ruby"] + ")ちゃん！\n誕生日は" + text[0]["ch_birth_month"] + "月" + text[0]["ch_birth_day"] + "日で，血液型は" + text[0]["ch_blood_type"] + "ね！\nパーソナルカラーは" + text[0]["ch_color"] + "で，CVは" + text[0]["cv_name"] + "(" + text[0]["cv_name_ruby"] + ")さんね！ ニックネームは" + text[0]["cv_nickname"] + "よ！" 
          else
            msg.send text[0]["type"] + "所属の" + text[0]["ch_name"] + "(" + text[0]["ch_name_ruby"] + ")ちゃん！\n誕生日は" + text[0]["ch_birth_month"] + "月" + text[0]["ch_birth_day"] + "日で，血液型は" + text[0]["ch_blood_type"] + "でパーソナルカラーは" + text[0]["ch_color"] + "よ！" 

          image_query = v: '1.0', rsz: '8', q: msg.match[2], safe: 'active'
          msg.http('http://ajax.googleapis.com/ajax/services/search/images')
            .query(image_query)
            .get() (err, res, body) ->
              images = JSON.parse(body)
              images = images.responseData?.results        
        
              image = msg.random images
       
              msg.send image.unescapedUrl

  robot.respond /imas birthday( me)? (.*)/i,(msg) ->
    
    imas_api_query = ch_birth_month: msg.match[2]
    msg.http('http://api.yagi2.com/imas/character/list')
      .query(imas_api_query)
      .get() (err, res, body) ->
        text = JSON.parse(body)
        
        msg.send text[0]["ch_birth_month"] + "月生まれのアイドルは" + text["result"] + "人いるわね！\n";
        
        for i in[0..text["result"]-1]
          msg.send text[i]["ch_name"] + "ちゃん！（" + text[i]["ch_birth_month"] + "月" + text[i]["ch_birth_day"] + "日生まれ）"
  
  
  robot.respond /imas cv( me)? (.*)/i,(msg) ->
    
    imas_api_query = cv_name: msg.match[2]
    
    msg.http('http://api.yagi2.com/imas/character/list')
      .query(imas_api_query)
      .get() (err, res, body) ->
        text = JSON.parse(body)
        if text["result"] isnt 0
          msg.send text[0]["cv_name"] + "(" + text[0]["cv_name_ruby"] + ")さんは誕生日が" + text[0]["cv_birth_month"] + "月" + text[0]["cv_birth_day"] + "日！\nニックネームは" + text[0]["cv_nickname"] + "で演じるのは" + text[0]["type"] + "所属の" + text[0]["ch_name"] + "(" + text[0]["ch_name_ruby"] + ")ちゃんよ！"
          
          image_query = v: '1.0', rsz: '8', q: msg.match[2], safe: 'active'
          msg.http('http://ajax.googleapis.com/ajax/services/search/images')
            .query(image_query)
            .get() (err, res, body) ->
              images = JSON.parse(body)
              images = images.responseData?.results        
        
              image = msg.random images
       
              msg.send image.unescapedUrl