LionsShare.Views.BrokerListingSubview = Backbone.View.extend({
  template: JST['root/broker_listing_subview'],

  initialize: function (options) {
    this.listing = options.model;
    this.parentView = options.parentView;
    // this.listenTo(this.listing, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      listing: this.listing
    });

    this.$el.html(content);
    return this;
  }
});
