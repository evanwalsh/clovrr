/* DO NOT MODIFY. This file was compiled Fri, 20 May 2011 05:07:54 GMT from
 * /Users/evan/rails/clovrr/app/scripts/admin.coffee
 */

(function() {
  $(function() {
    $("#preference_add").hide();
    $("#preferences").before('<div class="ajax_form" id="new_preference"></div>');
    return $("#new_preference").load('/admin/preferences/new form');
  });
}).call(this);
