LionsShare.Views.BrokerProfileView = Backbone.CompositeView.extend({
  template: JST['root/team_profile'],  

  initialize: function (options) {
	  this.broker = options.model;
	  this.broker.fetch({
	  	success: function () {
	  		var listings = this.broker.get('listings');
	          listings.forEach(function (listing) {
	  	        this.addListingSubview(listing);
	          }.bind(this));
	          this.render();
	  	}.bind(this)
	  });
  },

  addListingSubview: function (listing) {
    var subView = new LionsShare.Views.ListingSubview({
      model: listing,
      parentView: this
    });

    this.addSubview('.broker-listings', subView);
    return subView;
  },

  render: function () {
    var content = this.template({
      broker: this.broker.get('broker')
    });

    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});