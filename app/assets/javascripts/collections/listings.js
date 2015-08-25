LionsShare.Collections.Listings = Backbone.Collection.extend({
  model: LionsShare.Models.Listing,

  url: '/listings',

  getOrFetch: function (id) {
    var listing = this.get(id),
      listings = this;

    if (!listing) {
      listing = new LionsShare.Models.Listing({ id: id });
      listing.fetch({
        success: function () {
          listings.add(listing);
        }
      });
    } else {
      listing.fetch();
    }
      return listing;
  }
});

LionsShare.Collections.listings = new LionsShare.Collections.Listings();
