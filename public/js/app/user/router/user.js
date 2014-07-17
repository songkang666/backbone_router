UserRouter = Backbone.Router.extend({
    routes: {
        "":  "main",            // #
        "create": "create",     // #create
        "edit/:userID": "edit"  // #edit/xxxxxx
    },

    initialize: function() {
        this.hasUser = false;
    },

    main:function() {
        this.users = this.users || new Users;
        this.usersView = this.usersView || new UsersView({collection: this.users});
        $('#bookmain').show();
        this.bookerView.checkConditionHeight();
        $('#bookSearchAlert').hide();
        $('#bookSubmitMain').hide();
    },

    create: function() {

    },

    edit: function(userID) {
        var user = this.users.get(userID) || new User({_id: userID});
        var userView = new UserEditView({model: user});
    },

    edit:function(roomID,bookingID,startTime){
        var room = rooms.get(roomID) ? rooms.get(roomID) : new Room({_id:roomID});
        startTime = moment(parseInt(startTime)).format('YYYY-MM-DD HH:mm')
        var bookingModle = bookings.get(bookingID) ? bookings.get(bookingID) :  new Booking({room:room.get('_id'),_id:bookingID,startTime:startTime})
        this.renderBookingView(room,bookingModle,'#');
    },
    renderBookingView:function(room,bookingModle,returnUrl){
        var that = this;
        var tasks = [];
        if(!this.hasBooking) {
            tasks.push({id:'#dynamicJs',url:'js/book/model/externalUser.js'});
            tasks.push({id:'#dynamicJsUser',url:'js/book/model/user.js'});
            tasks.push({id:'#bookSubmitMain',url:'/book2 #bookSubmitMainDetail'});
            tasks.push({id:'#dynamicJs3',url:'js/organization/organization.js'});
            tasks.push({id:'#dynamicJs2',url:'js/book/booking.js'});

        }
        var FN = function(obj,callback){
            $(obj.id).load(obj.url,function(response, status, xhr){
                var err = status == 'success'?null:'err';
                callback(err)
            })
        };
        async.eachSeries(tasks,FN,function(err) {
            if(!that.hasBooking) {
                initTree();
                scrollUserList();
            }
            if(!err)  that.bookingSubmitView ? that.bookingSubmitView.initData(room,bookingModle,returnUrl) : (that.bookingSubmitView = new BookingSubmitView({model:room,bookingModel:bookingModle,returnUrl:returnUrl}));
            that.hasBooking = true;
        });
        $('#bookmain').hide();
        $('#bookSubmitMain').show();
    }
})
$(function(){
    var bookRouter = new BookRouter();
    Backbone.history.start();
})