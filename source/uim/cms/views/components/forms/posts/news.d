module uim.cms.views.components.forms.posts.news;

@safe:
import uim.cms;

class DCMSNewsItemForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSNewsItemForm", true));
}
mixin(ViewComponentCalls!("CMSNewsItemForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}