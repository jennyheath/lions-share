LionsShare.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'welcome',
    'sales': 'salesIndexView',
    'rentals': 'rentalsIndexView',
    'listings/:id': 'listingShow',
    'about_us': 'aboutUs'
  },

  aboutUs: function () {
    var view = new LionsShare.Views.AboutUs();
    
    this._swapView(view);
  },

  listingShow: function (id) {
    var listing = LionsShare.Collections.listings.getOrFetch(id);
    var view = new LionsShare.Views.ListingShow({
      model: listing
    });

    this._swapView(view);
  },

  rentalsIndexView: function () {
    var rentals = LionsShare.Collections.listings;
    var view = new LionsShare.Views.RentalsIndexView({
      collection: rentals
    });

    this._swapView(view);
  },

  salesIndexView: function () {
    var sales = LionsShare.Collections.listings;
    var view = new LionsShare.Views.SalesIndexView({
      collection: sales
    });

    this._swapView(view);
  },

  welcome: function () {
    var view = new LionsShare.Views.WelcomeView();

    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
});
