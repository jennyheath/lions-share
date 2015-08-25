window.LionsShare = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new LionsShare.Routers.Router({
      $rootEl: $('#main')
    });
    Backbone.history.start();
  }
};
