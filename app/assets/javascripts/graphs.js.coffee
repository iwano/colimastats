$(document).ready ->
  $('a#graph').click (e) ->
    e.preventDefault()
    circle = svg.selectAll(".circle")
    .data([32, 57, 112, 293])