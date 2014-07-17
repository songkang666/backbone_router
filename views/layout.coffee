doctype 5
html ->
  head ->
    meta name:"viewport", content="width=device-width, initial-scale=1.0", charset:'utf-8'
    link href:"/css/bootstrap.css", rel:"stylesheet"
    link href:"/css/common.css", rel:"stylesheet"
    script src:"/js/lib/jquery-1.10.2.js"
    script src:"/js/lib/bootstrap.js"
    script src: '/js/lib/underscore.js'
    script src: '/js/lib/backbone.js'
    script src:"/js/lib/jquery.cookies.js"
  body style:'min-width:1280px;', ->
    div class:"navbar navbar-inverse navbar-fixed-top ", role:"navigation", ->
      div class:"container ", ->
        div class:"navbar-header", ->
          button type:"button", class:"navbar-toggle", 'data-toggle':"collapse", 'data-target':".navbar-collapse", ->
            span class:"sr-only", -> 'Toggle navigation'
            span class:"icon-bar"
            span class:"icon-bar"
            span class:"icon-bar"
          a class:"navbar-brand", href:"#", ->'Test'
        div class:"collapse navbar-collapse",style:"min-width:794px;", ->
          ul class:"nav navbar-nav", id:'headNav', ->
            li class:"", -> a href:"/user/index", -> '用户'
          coffeescript ->
            actived = location.pathname
            $.each $('.nav li a'), (i,o) ->
              if actived is $(o).attr('href')
                $(o).parent().addClass('active').siblings('li').removeClass('active')
        coffeescript ->
    @body


