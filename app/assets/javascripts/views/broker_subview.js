LionsShare.Views.BrokerSubview = Backbone.View.extend({
  template: JST['listings/broker_subview'],

  events: {
    'click .see-broker-list': 'showBrokers',
    'click .select-agent': 'showIndividualBroker',
    'click .choose-broker': 'highlightBroker'
  },

  initialize: function (options) {
    this.broker = options.broker;
    this.listing = options.listing;
  },

  highlightBroker: function (event) {
    $('.selected-agent').each(function (i, broker) {
      $(broker).removeClass('selected-agent');
    });
    $(event.currentTarget).addClass('selected-agent');
  },

  showBrokers: function (event) {
    $('.single-agent').addClass('hide');
    $('.all-agents').removeClass('hide');
  },

  showIndividualBroker: function (event) {
    var view = this;
    var brokerName = $.trim($('.selected-agent').text()).split(" ");
    this.listing.get("all_brokers").forEach(function (broker) {
      if (broker.first_name === brokerName[0] &&
          broker.last_name === brokerName[1]) {
        view.broker = broker;
      }
    });
    view.render();
    $('.all-agents').addClass('hide');
    $('.single-agent').removeClass('hide');
  },

  render: function () {
    var content = this.template({
      broker: this.broker,
      listing: this.listing
    });

    this.$el.html(content);
    return this;
  }
});
