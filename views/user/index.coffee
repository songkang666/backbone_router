head ->
  title -> @title

div id: "main", ->
  div class:" well well-sm fix-top-2", ->
    div class :"container fixed-width",id:"usersView", ->
      a href: "#create", ->
        span class:"button btn btn-default", ->
          span class:"glyphicon glyphicon-trash", ->
          text  '&nbsp 新建'
  div class:'container fix-top-2-tablelist-default fixed-width',->
    div class: 'panel panel-default', ->
      table class: 'table table-striped',style:"table-layout:fixed;word-wrap:break-word;", ->
        thead class:"thead-color", ->
          tr ->
            th style:'width:30px', ->
              input type: 'checkbox',id:"allUsers"
            th class :"col-xs-2 curpointer name", ->
              text '姓名'
              b class:"caret", style:"display:none"
            th class :"col-xs-1 curpointer sex",->
              text '性别'
              b class:"caret", style:"display:none"
            th class :"col-xs-1 curpointer age",->
              text '年龄'
              b class:"caret", style:"display:none"
            th class :"col-xs-3 curpointer email",->
              text 'E-mail'
              b class:"caret", style:"display:none"
            th class :"col-xs-3 curpointer telephone",->
              text '手机号'
              b class:"caret", style:"display:none"
            th class:'col-xs-1 text-center', ->
              text '操作'
        tbody ->

script id:"userTemplate", type:"text/template", style:"display: none", ->
  td ->
    input type:"checkbox", value:"{{_id}}"
  td -> "{{name}}"
  td -> "{{sex}}"
  td -> "{{age}}"
  td -> "{{email}}"
  td -> "{{telephone}}"
  td ->
    div '.btn-group.btn-group-xs.pull-right', ->
      button '.btn.btn-info.edit', -> "编辑"
      button '.btn.btn-danger.delete', -> "删除"
script type:"text/javascript", src:"/js/app/user/model/user.js"
script type:"text/javascript", src:"/js/app/user/controller/index.js"
script type:"text/javascript", src:"/js/app/user/controller/edit.js"
coffeescript ->
  userRouter = new UserRouter()
  Backbone.history.start()

