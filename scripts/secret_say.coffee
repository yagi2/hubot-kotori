# Description
#   A Hubot script that echo from directmessage.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot secret say #room message
#
# Author:
#   Yagi2 <mail@yagi2.com>
#
module.exports = (robot) ->
  robot.respond /secret say (.*)/i,(msg) ->
	  mes = msg.match[1].split(" ")
	  
	  robot.send {room: mes[0]}, mes[1]
	  msg.send "#" + mes[0] + " にこっそり代わりに発言しておきましたよ，プロデューサーさん。"