# Description
#	A Hubot script that respond PINGPONG!!!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot PINGPONG
#
# Author:
#   Yagi2 <mail@yagi2.com>
#

module.exports = (robot) ->
	robot.respond /pingpong/i, (msg) ->
		msg.send "温泉で卓球しましょう！"