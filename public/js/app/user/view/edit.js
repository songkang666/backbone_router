UserEditView = Backbone.View.extend({
    el: "body",

    events: {
    },

    initialize: function() {
//        this.listenTo(this.model, "change", this.render);
    },

    render: function() {

    },

    addOne: function(user) {
        var userView = new UserView({model: user});
        this.$("tbody").append(userView.render().el);
    }
})