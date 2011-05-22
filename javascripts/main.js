$(function(){
  resizeVideo()
  $(window).bind('resize', function(){
    resizeVideo()
  })
})

function resizeVideo(){
  var height = $(".details iframe").height()
  var width = $(".details iframe").width()
  var ratio = height/width
  $(".details iframe").width($(".details").width())
  $(".details iframe").height($(".details").width() * ratio)
}