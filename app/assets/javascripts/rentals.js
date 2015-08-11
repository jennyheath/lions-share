$(document).on('page:change', function() {

  $.ajax({
    url: '/filters?by_type_of=Rental',
    type: 'GET',
    dataType: 'JSON'
  })
  .done(function(data) {

    var source = $("#listing_preview_template").html();
    var templatingFunction = Handlebars.compile(source);
    var context = {};
    context.match = data;

    if (data.length === 0) {
      $(".matches-wrapper").text("No matches found. Consider expanding your search restrictions.");
    } else {
      $(".matches-wrapper").text("");
      $(".matches-wrapper").append(templatingFunction(context));
    };

  })

  var $listingIds = []
  var $listingArr = $('.matches-wrapper').children().children()

  for (var i = 0; i < $listingArr.length; i++) {
    $listingId = $listingArr[i].attr("data-listing-id");
    $listingIds.push($listingId);
  }

  function initialize() {
    var options = {
      center: new google.maps.LatLng(40.650002, -73.949997),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), options);

  //   var marker, i;

  //   for (var i = 0; i < $listingIds.length; i++) {
  //     marker = new google.maps.Marker({
  //       position: new google.maps.LatLng($listingIds[i].latitude, $listingIds[i].longitude),
  //       map: map
  //     });
  //     marker.setMap(map);
  //   }
  }

  google.maps.event.addDomListener(window, 'load', initialize);

});

// Helper method for handlebars conditional
Handlebars.registerHelper('if_all', function() {
    var args = [].slice.apply(arguments);
    var opts = args.pop();

    var fn = opts.fn;
    for(var i = 0; i < args.length; ++i) {
        if(args[i])
            continue;
        fn = opts.inverse;
        break;
    }
    return fn(this);
});