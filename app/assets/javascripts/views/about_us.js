LionsShare.Views.AboutUs = Backbone.View.extend({
  template: JST['root/about_us'],

  initialize: function (options) {
    this.confirmation = options.modal;
  },

  openConfirmation: function () {
    jQuery.noConflict();
    $('#confirmationModal').modal('show');
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    if (this.confirmation === true) {
      window.setTimeout(function () {
        this.openConfirmation();
      }.bind(this), 1);
    }
    return this;
  }
});
