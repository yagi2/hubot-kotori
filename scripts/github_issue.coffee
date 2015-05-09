# Description:
#   create github issue
#
# Author:
#   @shokai

debug = require('debug')('hubot-github-issue')
repo  = process.env.HUBOT_GITHUB_ISSUE_REPO or "masuilab/todo"

module.exports = (robot) ->
  github = require('githubot')(robot)

  ## list issue
  robot.respond /issue$/i, (msg) ->
    debug "get issues list (#{repo})"
    github.get "https://api.github.com/repos/#{repo}/issues", {}, (issues) ->
      issues = issues.sort (a,b) -> a.number > b.number
      texts = ["https://github.com/#{repo}/issues"]
      for i in issues
        texts.push "[#{i.number}] #{i.title}"
      debug texts
      msg.send texts.join '\n'

  ## create issue
  robot.respond /issue (.+)$/mi, (msg) ->
    who = msg.message.user.name
    body = msg.match[1]
    debug "create issue #{body} (#{repo})"
    query_param =
      title: body
      body: "#{body}\n\ncreated by #{who} & hubot"
      labels: ["fromHubot"]
    github.post "https://api.github.com/repos/#{repo}/issues", query_param
    , (issue) ->
      text = "issue created\n#{issue.html_url}" or "issue create error"
      debug text
      msg.send text

