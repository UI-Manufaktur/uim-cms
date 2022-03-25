module uim.cms.views.components.forms.bodies.link;

@safe:
import uim.cms;

class DCMSLinkFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSLinkFormContent", true));
}
mixin(FormComponentCalls!("CMSLinkFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSLinkFormContent);
}}
