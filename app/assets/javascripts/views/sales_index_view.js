LionsShare.Views.SalesIndexView = Backbone.View.extend({
  template: JST['listings/sales_index'],

  initialize: function (options) {
    this.listings = new LionsShare.Collections.Listings();
    // this.listenTo(this.listings, "sync", this.render);
    this.render();
  },

  render: function () {
    var content = this.template();

    this.$el.html(content);
    return this;
  }
});
