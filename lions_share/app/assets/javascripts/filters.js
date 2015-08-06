$(document).on('page:change', function() {
  // initial call
  // updateMatches();
  // every change
  // $('.filterby').change(updateMatches);

});


function updateMatches() {

  //amenities
  // var $amenitiesElements = $('.filterby-amenity .autocomplete-container div')
  // var interestIds = $.map($interestElements, function(element) { return $(element).attr('data-id') });
  // var interestParams = '&interests=' + interestIds.join(',')

  // //values
  // var $valueElements = $('.filterby-value .autocomplete-container div')
  // var valueIds = $.map($valueElements, function(element) { return $(element).attr('data-id') });
  // var valueParams = '&values=' + valueIds.join(',')

  //combined
  var filterParams = $("form.filters").serialize()
  console.log(filterParams)
  $.ajax({
    url: '/filters?' + filterParams,
    type: 'GET',
    dataType: 'JSON'
  })
  .done(function(response) {
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
  });
};