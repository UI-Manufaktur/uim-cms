module uim.cms.views.components.forms.posts.docus;

@safe:
import uim.cms;
import models.cms.entities.docu;

class DCMSDocuForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSDocuForm", true));
}
mixin(ViewComponentCalls!("CMSDocuForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}
