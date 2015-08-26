LionsShare.Views.ListingSubview = Backbone.View.extend({
  template: JST['listings/listing_subview'],

  initialize: function (options) {
    this.listing = options.model;
    this.parentView = options.parentView;
    // this.listenTo(this.listing, 'sync', this.render);
  },

  highlightPin: function () {

  },

  render: function () {
    var content = this.template({
      listing: this.listing
    });

    this.$el.html(content);
    return this;
  }
});
