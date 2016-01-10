LionsShare.Views.BrokerProfileSubview = Backbone.View.extend({
  template: JST['root/broker_profile_subview'],

  initialize: function (options) {
    this.broker = options.model;
  },

  render: function () {
    var content = this.template({
      broker: this.broker
    });

    this.$el.html(content);
    return this;
  }
});
