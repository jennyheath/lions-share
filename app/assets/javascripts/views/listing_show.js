LionsShare.Views.ListingShow = Backbone.View.extend({
  template: JST['listings/listing_show'],

  events: {
    'click .view-all': 'showPhotos'
  },

  initialize: function (options) {
    var view = this;
    this.listing = options.model;
    this.listing.fetch({
      success: function () {
      }
    });
    // this.getSubways();

    this.listenTo(this.listing, 'sync', this.render);
  },

  addMap: function () {
    this.lat = this.listing.get('latitude');
    this.lng = this.listing.get('longitude');
    var LatLng = {lat: this.lat, lng: this.lng};

    var map_options = {
      center: new google.maps.LatLng(this.lat, this.lng),
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("subway-map"), map_options);
    this.map = map;
    var map_pin_img = "https://s3-us-west-1.amazonaws.com/lions-share-pictures/map-pin-unselected.svg";
    var pinIcon = new google.maps.MarkerImage(
      map_pin_img,
      null,
      null,
      null,
      new google.maps.Size(30, 40)
    );

    var marker = new google.maps.Marker({
      position: LatLng,
      map: map,
      id: this.listing.attributes.id,
      icon: pinIcon
    });
  },

  getSubways: function () {
    var listingLocation = new google.maps.LatLng(this.lat, this.lng);
    var request = {
      location: listingLocation,
      radius: '500',
      types: ['subway_station']
    };
    service = new google.maps.places.PlacesService(this.map);
    service.nearbySearch(request, function (results) {
      console.log(results);
    });
  },

  showPhotos: function (event) {
    $(event.target.nextElementSibling).addClass('show-photos');
    $(event.target).addClass('hide-text');
  },

  render: function () {
    var content = this.template({
      listing: this.listing
    });

    this.$el.html(content);
    this.addMap();
    return this;
  }
});
