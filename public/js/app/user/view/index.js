_.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
}

var UserView = Backbone.View.extend({
    tagName: "tr",

    template: _.template($("#userTemplate").html()),

    events: {
        "click .edit": "edit",
        "click .delete": "clear"
    },

    initialize: function() {
        this.listenTo(this.model, "change", this.render);
        this.listenTo(this.model, "destroy", this.remove);
    },

    render: function() {
        var data = this.model.toJSON();
        this.$el.html(this.template(data));
        return this;
    },

    edit: function(e) {

    },

    clear: function(e) {
        this.model.destroy();
    }
});

var UsersView = Backbone.View.extend({
    el: "body",

    events: {
    },

    initialize: function() {
        this.listenTo(this.collection, "add", this.addOne);
    },

    render: function() {

    },

    addOne: function(user) {
        var userView = new UserView({model: user});
        this.$("tbody").append(userView.render().el);
    }
})