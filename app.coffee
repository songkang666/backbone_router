# Module dependencies
express = require 'express'
app = express()
mongoose = require 'mongoose'
Schema = mongoose.Schema
partials = require('express-partials')
mongoose.connect 'mongodb://localhost/test'
Guid = require 'guid'
async = require 'async'
_ = require 'underscore'

# all environments
app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'coffee'
app.engine 'coffee',require('coffeecup').__express

app.use require('morgan')({ format: 'dev' })
app.use require('body-parser')()
app.use require('method-override')()
app.use require('cookie-parser')()
app.use require('cookie-session') {secret:'shgbit'}
app.use partials()
app.use express.static "#{__dirname}/public"

partials.register('coffee','coffeecup')
partials.register('coffee',require('coffeecup'))
partials.register('coffee',require('coffeecup').render)

db = mongoose.connection
db.on 'error', (err)-> console.log err
db.once 'open', -> console.log 'db is opened'

# 权限验证
#app.use (req, res, next)->
#  console.log JSON.stringify req.cookies
#  return next() if req.url.indexOf '/login' >= 0
#  unless req.cookies.userid?
#    res.render 'test'
#  else next()
app.get "/user/index", (req, res) ->
  res.render "user/index"

app.get "/users", (req, res) ->
  res.json 0

app.get "/users/:useID",  (req, res) ->
  res.json 0

app.post "/users/:userID", (req, res) ->
  res.send 200

app.listen 3001, ->
  console.log 'listening on port 3001'