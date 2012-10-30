var Gmaps4Rails={map:null,visibleInfoWindow:null,userLocation:null,map_options:{id:"gmaps4rails_map",disableDefaultUI:!1,disableDoubleClickZoom:!1,draggable:!0,type:"HYBRID",detect_location:!1,center_on_user:!1,center_latitude:0,center_longitude:0,zoom:2,maxZoom:null,minZoom:null,auto_adjust:!0,auto_zoom:!0,bounds:[]},markers_conf:{title:"",picture:"",width:22,length:32,draggable:!1,anchor:null,do_clustering:!0,clusterer_gridSize:50,clusterer_maxZoom:5,randomize:!0,max_random_distance:100,list_container:null,custom_cluster_pictures:null,custom_infowindow_class:null,offset:0},markers:[],bounds_object:null,polygons:[],polylines:[],circles:[],markerClusterer:null,polygons_conf:{strokeColor:"#FFAA00",strokeOpacity:.8,strokeWeight:2,fillColor:"#000000",fillOpacity:.35},polylines_conf:{strokeColor:"#FF0000",strokeOpacity:1,strokeWeight:2},circles_conf:{fillColor:"#00AAFF",fillOpacity:.35,strokeColor:"#FFAA00",strokeOpacity:.8,strokeWeight:2,clickable:!1,zIndex:null},direction_conf:{panel_id:null,display_panel:!1,origin:null,destination:null,waypoints:[],optimizeWaypoints:!1,unitSystem:"METRIC",avoidHighways:!1,avoidTolls:!1,region:null,travelMode:"DRIVING"},initialize:function(){this.map=new google.maps.Map(document.getElementById(this.map_options.id),{maxZoom:this.map_options.maxZoom,minZoom:this.map_options.minZoom,zoom:this.map_options.zoom,center:new google.maps.LatLng(this.map_options.center_latitude,this.map_options.center_longitude),mapTypeId:google.maps.MapTypeId[this.map_options.type],mapTypeControl:this.map_options.mapTypeControl,disableDefaultUI:this.map_options.disableDefaultUI,disableDoubleClickZoom:this.map_options.disableDoubleClickZoom,draggable:this.map_options.draggable}),(this.map_options.detect_location===!0||this.map_options.center_on_user===!0)&&this.findUserLocation(),this.reset_sidebar_content()},findUserLocation:function(){navigator.geolocation?navigator.geolocation.getCurrentPosition(function(e){Gmaps4Rails.userLocation=new google.maps.LatLng(e.coords.latitude,e.coords.longitude),Gmaps4Rails.map_options.center_on_user===!0&&Gmaps4Rails.map.setCenter(Gmaps4Rails.userLocation)},function(){this.fnSet("gmaps4rails_geolocation_failure")&&gmaps4rails_geolocation_failure(!0)}):this.fnSet("gmaps4rails_geolocation_failure")&&gmaps4rails_geolocation_failure(!1)},create_direction:function(){var e=new google.maps.DirectionsRenderer,t=new google.maps.DirectionsService;e.setMap(this.map),this.direction_conf.display_panel&&e.setPanel(document.getElementById(this.direction_conf.panel_id)),e.setOptions({suppressMarkers:!1,suppressInfoWindows:!1,suppressPolylines:!1});var n={origin:this.direction_conf.origin,destination:this.direction_conf.destination,waypoints:this.direction_conf.waypoints,optimizeWaypoints:this.direction_conf.optimizeWaypoints,unitSystem:google.maps.DirectionsUnitSystem[this.direction_conf.unitSystem],avoidHighways:this.direction_conf.avoidHighways,avoidTolls:this.direction_conf.avoidTolls,region:this.direction_conf.region,travelMode:google.maps.DirectionsTravelMode[this.direction_conf.travelMode],language:"en"};t.route(n,function(t,n){n==google.maps.DirectionsStatus.OK&&e.setDirections(t)})},create_circles:function(){for(var e=0;e<this.circles.length;++e)this.create_circle(this.circles[e])},create_circle:function(e){i===0&&(this.exists(e.strokeColor)&&(this.circles_conf.strokeColor=e.strokeColor),this.exists(e.strokeOpacity)&&(this.circles_conf.strokeOpacity=e.strokeOpacity),this.exists(e.strokeWeight)&&(this.circles_conf.strokeWeight=e.strokeWeight),this.exists(e.fillColor)&&(this.circles_conf.fillColor=e.fillColor),this.exists(e.fillOpacity)&&(this.circles_conf.fillOpacity=e.fillOpacity));if(this.exists(e.latitude)&&this.exists(e.longitude)){var t=new google.maps.Circle({center:new google.maps.LatLng(e.latitude,e.longitude),strokeColor:e.strokeColor||this.circles_conf.strokeColor,strokeOpacity:e.strokeOpacity||this.circles_conf.strokeOpacity,strokeWeight:e.strokeWeight||this.circles_conf.strokeWeight,fillOpacity:e.fillOpacity||this.circles_conf.fillOpacity,fillColor:e.fillColor||this.circles_conf.fillColor,clickable:e.clickable||this.circles_conf.clickable,zIndex:e.zIndex||this.circles_conf.zIndex,radius:e.radius});e.google_object=t,t.setMap(this.map)}},clear_circles:function(){for(var e=0;e<this.circles.length;++e)this.clear_circle(this.circles[e])},clear_circle:function(e){e.google_object.setMap(null)},hide_circles:function(){for(var e=0;e<this.circles.length;++e)this.hide_circle(this.circles[e])},hide_circle:function(e){e.google_object.setMap(null)},show_circles:function(){for(var e=0;e<this.circles.length;++e)this.show_circle(this.circles[e])},show_circle:function(e){e.google_object.setMap(this.map)},create_polygons:function(){for(var e=0;e<this.polygons.length;++e)this.create_polygon(e)},create_polygon:function(e){var t=[],n,r,i,s,o;for(var u=0;u<this.polygons[e].length;++u){var a=new google.maps.LatLng(this.polygons[e][u].latitude,this.polygons[e][u].longitude);t.push(a),u===0&&(n=this.polygons[e][u].strokeColor||this.polygons_conf.strokeColor,r=this.polygons[e][u].strokeOpacity||this.polygons_conf.strokeOpacity,i=this.polygons[e][u].strokeWeight||this.polygons_conf.strokeWeight,s=this.polygons[e][u].fillColor||this.polygons_conf.fillColor,o=this.polygons[e][u].fillOpacity||this.polygons_conf.fillOpacity)}var f=new google.maps.Polygon({paths:t,strokeColor:n,strokeOpacity:r,strokeWeight:i,fillColor:s,fillOpacity:o,clickable:!1});this.polygons[e].google_object=f,f.setMap(this.map)},create_polylines:function(){for(var e=0;e<this.polylines.length;++e)this.create_polyline(e)},create_polyline:function(e){var t=[],n,r,i;for(var s=0;s<this.polylines[e].length;++s)if(this.exists(this.polylines[e][s].coded_array)){var o=new google.maps.geometry.encoding.decodePath(this.polylines[e][s].coded_array);for(var u=0;u<o.length;++u)t.push(o[u]),t.push(o[u])}else{s===0&&(n=this.polylines[e][0].strokeColor||this.polylines_conf.strokeColor,r=this.polylines[e][0].strokeOpacity||this.polylines_conf.strokeOpacity,i=this.polylines[e][0].strokeWeight||this.polylines_conf.strokeWeight);if(this.exists(this.polylines[e][s].latitude)&&this.exists(this.polylines[e][s].longitude)){var a=new google.maps.LatLng(this.polylines[e][s].latitude,this.polylines[e][s].longitude);t.push(a)}}var f=new google.maps.Polyline({path:t,strokeColor:n,strokeOpacity:r,strokeWeight:i,clickable:!1});this.polylines[e].google_object=f,f.setMap(this.map)},create_markers:function(){this.create_google_markers_from_markers(),this.clusterize(),this.adjust_map_to_bounds()},create_google_markers_from_markers:function(){for(var e=this.markers_conf.offset;e<this.markers.length;++e)if(!this.exists(this.markers[e].google_object)){var t=this.exists(this.markers[e].picture)?this.markers[e].picture:this.markers_conf.picture,n=this.exists(this.markers[e].width)?this.markers[e].width:this.markers_conf.width,r=this.exists(this.markers[e].height)?this.markers[e].height:this.markers_conf.length,i=this.exists(this.markers[e].anchor)?this.markers[e].anchor:this.markers_conf.anchor,s=this.exists(this.markers[e].title)?this.markers[e].title:null,o=this.exists(this.markers[e].draggable)?this.markers[e].draggable:this.markers_conf.draggable,u=this.markers[e].latitude,a=this.markers[e].longitude,f=null;this.exists(this.markers[e].width)&&this.exists(this.markers[e].height)&&i!==null&&(f=this.getImageAnchorPosition(n,r,i));if(this.markers_conf.randomize){var l=this.randomize(u,a);u=l[0],a=l[1]}var c=new google.maps.LatLng(u,a),h;if(t==="")h=new google.maps.Marker({position:c,map:this.map,title:s,draggable:o});else{var p=new google.maps.MarkerImage(t,new google.maps.Size(n,r),null,f,null);h=new google.maps.Marker({position:c,map:this.map,icon:p,title:s,draggable:o})}this.markers[e].google_object=h,this.create_info_window(this.markers[e]),this.create_sidebar(this.markers[e])}this.markers_conf.offset=this.markers.length},getImageAnchorPosition:function(e,t,n){var r,i;switch(n){case"top_left":r=0,i=0;break;case"top_center":r=e/2,i=0;break;case"top_right":r=e,i=0;break;case"center_left":r=0,i=t/2;break;case"center":r=e/2,i=t/2;break;case"center_right":r=e,i=t/2;break;case"bottom_left":r=0,i=t;break;case"bottom_center":r=e/2,i=t;break;case"bottom_right":r=e,i=t}return new google.maps.Point(r,i)},clear_markers:function(){for(var e=0;e<this.markers.length;++e)this.clear_marker(this.markers[e])},clear_marker:function(e){e.google_object.setMap(null)},show_markers:function(){for(var e=0;e<this.markers.length;++e)this.show_marker(this.markers[e])},show_marker:function(e){e.google_object.setVisible(!0)},hide_markers:function(){for(var e=0;e<this.markers.length;++e)this.hide_marker(this.markers[e])},hide_marker:function(e){e.google_object.setVisible(!1)},replace_markers:function(e){this.markers_conf.offset=0,this.markers=new Array,this.google_bounds=new google.maps.LatLngBounds,this.reset_sidebar_content(),this.add_markers(e)},add_markers:function(e){this.markers=this.markers.concat(e),this.create_markers()},clusterize:function(){if(this.markers_conf.do_clustering===!0){this.markerClusterer!==null&&this.markerClusterer.clearMarkers();var e=new Array;for(var t=0;t<this.markers.length;++t)e.push(this.markers[t].google_object);var n=null;this.fnSet("gmaps_custom_clusterer_pic")&&(n=gmaps_custom_clusterer_pic()),this.markerClusterer=new MarkerClusterer(this.map,e,{maxZoom:this.markers_conf.clusterer_maxZoom,gridSize:this.markers_conf.clusterer_gridSize,styles:n})}},create_info_window:function(e){var t;if(this.markers_conf.custom_infowindow_class===null)t=new google.maps.InfoWindow({content:e.description}),google.maps.event.addListener(e.google_object,"click",this.openInfoWindow(t,e.google_object));else if(this.exists(e.description)){var n=document.createElement("div");n.setAttribute("class",this.markers_conf.custom_infowindow_class),n.innerHTML=e.description,t=new InfoBox(gmaps4rails_infobox(n)),google.maps.event.addListener(e.google_object,"click",this.openInfoWindow(t,e.google_object))}},openInfoWindow:function(e,t){return function(){Gmaps4Rails.visibleInfoWindow&&Gmaps4Rails.visibleInfoWindow.close(),e.open(Gmaps4Rails.map,t),Gmaps4Rails.visibleInfoWindow=e}},create_sidebar:function(e){if(this.markers_conf.list_container){var t=document.getElementById(this.markers_conf.list_container),n=document.createElement("li"),r=document.createElement("a");r.href="javascript:void(0);";var i=this.exists(e.sidebar)?e.sidebar:"Marker";r.innerHTML=i,r.onclick=this.sidebar_element_handler(e.google_object,"click"),n.appendChild(r),t.appendChild(n)}},sidebar_element_handler:function(e,t){return function(){Gmaps4Rails.map.panTo(e.position),google.maps.event.trigger(e,t)}},reset_sidebar_content:function(){if(this.markers_conf.list_container!==null){var e=document.getElementById(this.markers_conf.list_container);e.innerHTML=""}},adjust_map_to_bounds:function(e){if(this.map_options.auto_adjust||this.map_options.bounds!==null)this.google_bounds=new google.maps.LatLngBounds;if(this.map_options.auto_adjust){for(var t=0;t<this.markers.length;++t)this.google_bounds.extend(this.markers[t].google_object.position);for(var t=0;t<this.polylines.length;++t)this.polylines[t].google_object.latLngs.forEach(function(e){e.forEach(function(e){Gmaps4Rails.google_bounds.extend(e)})});for(var t=0;t<this.polygons.length;++t)this.polygons[t].google_object.latLngs.forEach(function(e){e.forEach(function(e){Gmaps4Rails.google_bounds.extend(e)})});for(var t=0;t<this.circles.length;++t)this.google_bounds.extend(this.circles[t].google_object.getBounds().getNorthEast()),this.google_bounds.extend(this.circles[t].google_object.getBounds().getSouthWest())}for(var t=0;t<this.map_options.bounds.length;++t){var n=new google.maps.LatLng(this.map_options.bounds[t].lat,this.map_options.bounds[t].lng);this.google_bounds.extend(n)}if(this.map_options.auto_adjust||this.map_options.bounds.length>0)if(!this.map_options.auto_zoom){var r=this.google_bounds.getCenter();this.map_options.center_longitude=r.lat(),this.map_options.center_latitude=r.lng(),this.map.setCenter(r)}else this.map.fitBounds(this.google_bounds)},exists:function(e){return e!==""&&typeof e!="undefined"},fnSet:function(e){return typeof e=="function"},randomize:function(e,t){var n=this.markers_conf.max_random_distance*this.random(),r=this.markers_conf.max_random_distance*this.random(),i=parseFloat(e)+180/Math.PI*(r/6378137),s=parseFloat(t)+90/Math.PI*(n/6378137)/Math.cos(e);return[i,s]},random:function(){return Math.random()*2-1}};