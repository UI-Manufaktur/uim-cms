module uim.cms.views.components.forms.posts.demos;

@safe:
import uim.cms;
import models.cms.entities.demo;

class DCMSDemoForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSDemoForm", true));
}
mixin(ViewComponentCalls!("CMSDemoForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}
