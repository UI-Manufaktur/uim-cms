module uim.cms.views.components.forms.posts.glossary;

@safe:
import uim.cms;
import models.cms.entities.glossary_item;

class DCMSGlossaryItemForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSGlossaryItemForm", true));
}
mixin(ViewComponentCalls!("CMSGlossaryItemForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}