module.exports = (robot) ->
	robot.respond /unasuketter/i, (msg) ->
		url = "http://shindanmaker.com/321664"
		data = u: "やぎにい", from: ""
		
		robot.http(url)
			.post(data) (err, res, body) ->
				msg.send body