# Description
#   A Hubot script that respond enjo enjoy.
#   Using https://enjo-generator.herokuapp.com
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot 炎上 [text1] [text2]
#
# Author:
#   Yagi2 <mail@yagi2.com>
#
module.exports = (robot) ->
  robot.respond /炎上 (.*)/i,(msg) ->
    mes = msg.match[1].split(" ")
    
    q = text1: mes[0], text2: mes[1]
    
    msg.send 'https://enjo-generator.herokuapp.com/api/create-enjo?text1=' + encodeURIComponent(mes[0]) + '&text2=' + encodeURIComponent(mes[1])
