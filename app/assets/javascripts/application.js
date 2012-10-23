// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function gmaps4rails_callback() {
  
  // google.maps.event.addListener(Gmaps4Rails.map, "load", function() {
  //   if (Gmaps4Rails.markers.length == 0) {
  //     var centerpoint = new google.maps.LatLng(19.2433112, -103.7247534);
  //     Gmaps4Rails.map.setCenter(centerpoint)
  //     Gmaps4Rails.map.setZoom(8);
  //   }else if (Gmaps4Rails.markers.length == 1){
  //     Gmaps4Rails.map.setZoom(16);
  //   }
  // });

  function say_yo(arg) { return function(){
    get_locality_stats(Gmaps4Rails.markers[arg].description);
    };
  };
  
  for (var i = 0; i <  Gmaps4Rails.markers.length; ++i) {
    google.maps.event.addListener(Gmaps4Rails.markers[i].google_object, 'click', say_yo(i));
  }
  
}
function get_locality_stats(description){
  var city_name = '';
  description = description.substr(4);
  var indx = description.indexOf('<');
  name = description.substr(0, indx);
  $.ajax({
  url: "stats/show",
  type: "get",
  data: {
    name: name
  }
});
}

