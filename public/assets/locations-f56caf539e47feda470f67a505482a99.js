(function(){$(document).ready(function(){var e,t,n;return t=$(window).height(),$("#map_container").height(t),$("#gmaps4rails_map").height(t),$("select#location_state_id").change(function(){var e;return e=void 0,e=$("select#location_state_id :selected").val(),e===""&&(e="0"),jQuery.get("/locations/getcities/"+e,function(e){return $("#citiesSelect").html(e)}),!1}),$("select#location_city_id").live("change",function(){var e;return e=void 0,e=$("select#location_city_id :selected").val(),e===""&&(e="0"),jQuery.get("/locations/getlocalities/"+e,function(e){return $("#localitiesSelect").html(e)}),!1}),$("select#location_locality_id").live("change",function(){var t,r,i;return r=void 0,r=$("select#location_locality_id :selected").val(),r===""&&(r="0"),t=$("select#location_city_id :selected").val(),i=$("select#location_state_id :selected").val(),$.ajax({url:"locations",type:"POST",data:{location:{state_id:i,city_id:t,locality_id:r}},success:function(t){return Gmaps4Rails.replace_markers(t),Gmaps4Rails.map.setZoom(16),e(t),n(r)}}),!1}),e=function(e){var t;return t="<tr id='"+e.id+"'><th><a href='/' class='show_marker_stats'>"+e.name+"</a></th><td><a href='/' class='marker-details'>Detalles</a></td>",e.name!=="Total de la Entidad"?t+="<td><a href='/locations/"+e.id+"' data-confirm='Estas seguro?' data-method='delete' data-remote='true' rel='nofollow' class='marker-details'>Borrar</a></td></tr>":t+="</tr>",$("table#markers").append($(t))},$("#hideMarkers").click(function(e){return e.preventDefault(),Gmaps4Rails.clear_markers()}),$("#showMarkers").click(function(e){return e.preventDefault(),Gmaps4Rails.create_markers()}),n=function(e){return $.ajax({url:"stats/show",type:"get",data:{id:e}})},$(".show_marker_stats").live("click",function(e){var t;return e.preventDefault(),t=$(this).text(),$.ajax({url:"stats/show",type:"get",data:{name:t}})}),$("#gohere").click(function(e){var t,n,r;return e.preventDefault(),r=$(this).attr("data-long"),n=$(this).attr("data-lat"),t=new google.maps.LatLng(n,r),Gmaps4Rails.map.setCenter(t),Gmaps4Rails.map.setZoom(17)}),$("#reload").click(function(e){return e.preventDefault(),location.reload()}),$("#help").click(function(e){return e.preventDefault(),$("#help-modal").modal("toggle")}),$(".marker-details").live("click",function(e){var t;return e.preventDefault(),t=$(this).parent().prev().text(),$.ajax({url:"locations/show",type:"get",data:{name:t}})}),$("#graphs").click(function(e){return e.preventDefault(),window.open("/graphs")})})}).call(this);