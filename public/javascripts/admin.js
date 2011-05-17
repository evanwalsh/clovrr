/* DO NOT MODIFY. This file was compiled Tue, 17 May 2011 03:32:38 GMT from
 * /Users/evan/rails/clovrr/app/scripts/admin.coffee
 */

(function() {
  $(function() {
    $("#preferences").before('<div class="ajax_form" id="new_preference"></div>');
    return $("#new_preference").load('/admin/preferences/new form');
  });
}).call(this);
