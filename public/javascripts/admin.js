(function() {
  $(function(){
    $("form.post #preview").bind('click', function(){
      // $.post('/admin/posts/preview', $("form.post").serialize())
      $("form.post").attr('action', '/admin/posts/preview')
      $("form.post").submit()
    })
  });
}).call(this);
