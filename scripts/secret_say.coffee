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
	  
	  msg.send { room: "sandbox" }, mes[1]