module uim.cms.views.components.forms.posts.links;

@safe:
import uim.cms;
import models.cms.entities.link;

class DCMSLinkForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSLinkForm", true));
}
mixin(ViewComponentCalls!("CMSLinkForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}