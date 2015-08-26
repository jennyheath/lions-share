LionsShare.Views.ListingShow = Backbone.View.extend({
  template: JST['listings/listing_show'],

  initialize: function (options) {
    var view = this;
    this.listing = options.model;
    this.listing.fetch({
      success: function () {
      }
    });

    this.listenTo(this.listing, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      listing: this.listing
    });

    this.$el.html(content);
    return this;
  }
});
