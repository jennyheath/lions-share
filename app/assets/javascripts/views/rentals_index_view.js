LionsShare.Views.RentalsIndexView = Backbone.CompositeView.extend({
  template: JST['listings/rentals_index'],

  initialize: function (options) {
    this.listings = new LionsShare.Collections.Listings();
    this.listings.fetch({
      success: function () {
        console.log("fetched successfully");
      }
    });
    this.listenTo(this.listings, "sync", this.render);
    this.listenTo(this.listings, "add", this.addListingSubview);
  },

  addListingSubview: function (model) {
    var listing = this.listings.getOrFetch(model.id, { parse: true });
    var subView = new LionsShare.Views.ListingSubview({
      model: listing,
      parentView: this
    });

    this.addSubview('.matches-wrapper', subView);
  },

  render: function () {
    var content = this.template({
      listings: this.listings
    });

    this.$el.html(content);
    var map_options = {
      // Initial LatLng set for Brooklyn
      center: new google.maps.LatLng(40.650002, -73.949997),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), map_options);
    return this;
  }
});
