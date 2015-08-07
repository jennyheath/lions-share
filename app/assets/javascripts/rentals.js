$(document).on('page:change', function() {

  $.ajax({
    url: '/filters?by_type_of=Rental',
    type: 'GET',
    dataType: 'JSON'
  })
  .done(function(data) {
    // debugger
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

  });

});

$(document).ready(function() {

  var map = new GMaps({
      div: '#map-canvas',
      lat: 40.6928,
      lng: 73.9903,
      width: '500px',
      height: '500px',
      zoom: 12,
      zoomControl: true,
      zoomControlOpt: {
          style: 'SMALL',
          position: 'TOP_LEFT'
      },
      panControl: false
  });

});

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