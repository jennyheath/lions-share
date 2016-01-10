LionsShare.Collections.Brokers = Backbone.Collection.extend({
  model: LionsShare.Models.Broker,

  url: '/brokers',

  getOrFetch: function (id) {
    var broker = this.get(id),
        brokers = this;

    if (!broker) {
      broker = new LionsShare.Models.Broker({ id: id });
      broker.fetch({
        success: function () {
          brokers.add(broker);
        }
      });
    } else {
      broker.fetch();
    }

    return broker;
  }
});

LionsShare.Collections.brokers = new LionsShare.Collections.Brokers();