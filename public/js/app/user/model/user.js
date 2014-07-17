var User = Backbone.Model.extend({
    idAttribute: "_id",

    initialize: function() {
    },

    defaults: {
        _id: null,
        name: "",
        sex: "m",
        age: 0,
        email: "",
        telephone: 0
    }
});

var Users = Backbone.Collection.extend({
    url: "/users",

    model: User,

    initialize: function() {
    }
});
