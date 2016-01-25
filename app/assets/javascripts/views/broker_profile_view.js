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
    var subView = new LionsShare.Views.BrokerListingSubview({
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
    $('.listing-subview').each(function (i, div) {
      div.className = "listing-subview col-xs-12 col-sm-4 col-md-4 col-lg-4";
    });
    $('.info-wrapper').each(function (i, div) {
      div.className = "info-wrapper row broker-subview-info";
    });
    return this;
  }
});
