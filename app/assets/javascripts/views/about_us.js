LionsShare.Views.AboutUs = Backbone.View.extend({
  template: JST['root/about_us'],

  render: function () {
    var content = this.template();
    
    this.$el.html(content);
    return this;
  }
});
