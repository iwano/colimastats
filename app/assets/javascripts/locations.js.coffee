# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("select#location_state_id").change ->
    state = undefined
    state = $("select#location_state_id :selected").val()
    state = "0"  if state is ""
    jQuery.get "/locations/getcities/" + state, (data) ->
      $("#citiesSelect").html data

    false

  $("select#location_city_id").live "change", ->
    city = undefined
    city = $("select#location_city_id :selected").val()
    city = "0"  if city is ""
    jQuery.get "/locations/getlocalities/" + city, (data) ->
      $("#localitiesSelect").html data

    false

  $("select#location_locality_id").live "change", ->
    locality = undefined
    locality = $("select#location_locality_id :selected").val()
    locality = "0"  if locality is ""
    city = $("select#location_city_id :selected").val()
    state = $("select#location_state_id :selected").val()
    $.ajax
      url: "locations"
      type: "POST"
      data: {location:{state_id: state, city_id: city, locality_id: locality}}
      success: (data) ->
        Gmaps4Rails.replace_markers(data)
        Gmaps4Rails.map.setZoom(16);
        add_marker(data)
        show_stats(locality)

    false

  add_marker = (data) ->
    row = "<tr id='" + data.id + "'><th><a href='/' class='show_marker_stats'>" + data.name + "</a></th><td><a href='/' class='marker-details'>Detalles</a></td>"
    if data.name != 'Total de la Entidad'
      row += "<td><a href='/locations/" + data.id + "' data-confirm='Estas seguro?' data-method='delete' data-remote='true' rel='nofollow' class='marker-details'>Borrar</a></td></tr>"
    else
      row += "</tr>"
    $('table#markers').append($(row))

  $('#hideMarkers').click (e) ->
    e.preventDefault()
    Gmaps4Rails.clear_markers()

  $('#showMarkers').click (e) ->
    e.preventDefault()
    Gmaps4Rails.create_markers()

  show_stats = (id) ->
    $.ajax
      url: "stats/show"
      type: "get"
      data: {id: id}

  $('.show_marker_stats').live "click", (e) ->
    e.preventDefault()
    name = $(this).text()
    $.ajax
      url: "stats/show"
      type: "get"
      data: {name: name}

  $('#gohere').click (e) ->
    e.preventDefault()
    locality_long = $(this).attr('data-long')
    locality_lat = $(this).attr('data-lat')
    centerpoint = new google.maps.LatLng(locality_lat, locality_long)
    Gmaps4Rails.map.setCenter(centerpoint)
    Gmaps4Rails.map.setZoom(17)

  $('#reload').click (e) ->
    e.preventDefault()
    location.reload()

  $('#help').click (e) ->
    e.preventDefault()
    $('#help-modal').modal('toggle')


  $('.marker-details').live 'click', (e) ->
    e.preventDefault()
    name = $(this).parent().prev().text()
    $.ajax
      url: "locations/show"
      type: "get"
      data: {name: name}
    