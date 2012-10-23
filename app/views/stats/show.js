var element = $("<%= escape_javascript(render @stat)%>");
$("#stats_details").empty();
$("#stats_details").append(element);
$('#gohere').attr('disabled',false);
$('#gohere').attr('data-long',"<%=@marker.longitude%>");
$('#gohere').attr('data-lat',"<%=@marker.latitude%>");