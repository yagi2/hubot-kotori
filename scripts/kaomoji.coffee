# Description
#	A Hubot script that respond kaomoji from http://kaomoji.n-at.me/
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot kaomoji (It return random kaomoji)
#
# Author:
#   unasuke <yusuke1994525@gmail.com>
#

module.exports = (robot) ->
  robot.respond /kaomoji/i, (msg) ->
    msg.http('http://kaomoji.n-at.me/random.json')
      .get() (err, res, body) ->
        json = JSON.parse(body)
        msg.send json.record.text
