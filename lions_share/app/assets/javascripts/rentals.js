$(document).on('page:change', function() {

  $.ajax({
    url: '/filters?by_type_of=Rental',
    type: 'GET',
    dataType: 'JSON'
  })
  .done(function(response) {
    debugger
    var source = $("#listing_preview_template").html();
    var templatingFunction = Handlebars.compile(source);
    var context = {};
    context.match = response;
    if (response.length === 0) {
      $(".matches-wrapper").text("No matches found. Consider expanding your search restrictions.");
    } else {
      $(".matches-wrapper").text("");
      $(".matches-wrapper").append(templatingFunction(context));
    };

    function initialize() {
      var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
      var mapOptions = {
        zoom: 4,
        center: myLatlng
      }
      var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

      var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: 'Hello World!'
      });
    }

    google.maps.event.addDomListener(window, 'load', initialize);

  })

});