LionsShare.Views.BrokersIndexView = Backbone.CompositeView.extend({
  template: JST['root/team_view'],

  initialize: function (options) {
    var view = this;
    view.brokers = new LionsShare.Collections.Brokers();
    view.brokers.fetch({
      success: function () {
        view.brokers.models[0].attributes.brokers.forEach(function (broker) {
          view.addBrokerProfileSubview(broker);
        });
      }
    });
  },

  addBrokerProfileSubview: function (broker) {
    var subView = new LionsShare.Views.BrokerProfileSubview({
      model: broker,
      parentView: this
    });
    subView.$el.addClass('team-member-box');
    subView.$el.addClass('col-lg-3');
    subView.$el.addClass('col-md-3');
    subView.$el.addClass('col-sm-3');
    subView.$el.addClass('col-centered');

    this.addSubview('.team-index', subView);
    return subView;
  },

  render: function () {
    var content = this.template({
      brokers: this.brokers
    });

    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
