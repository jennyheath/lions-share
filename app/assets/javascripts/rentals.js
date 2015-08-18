$(document).on('page:change', function() {

  // I was testing this first with only the rentals, so I hardcoded that in my params -- but this is when I was still using has_scope and had a filters controller -- I think filterrific has a better way of doing this

  $.ajax({
    url: '/filter_rentals?by_type_of=Rental',
    type: 'GET',
    dataType: 'JSON'
  })
  .done(function(data) {

    // Handlebars templating
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

  function initialize() {
    var options = {
      // Initial LatLng set for Brooklyn
      center: new google.maps.LatLng(40.650002, -73.949997),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), options);

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