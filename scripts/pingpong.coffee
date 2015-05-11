# Description:
#   PINGPONG!
#

module.exports = (robot) ->
	robot.respond /pingpong/i, (msg) ->
		msg.send "温泉で卓球しましょう！"