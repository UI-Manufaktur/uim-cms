module uim.cms.views.components.forms.bodies.offer;

@safe:
import uim.cms;

class DCMSOfferFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSOfferFormContent", true));
}
mixin(FormComponentCalls!("CMSOfferFormContent", true));

version(test_uim_cms) {
  unittest {
   assert(CMSOfferFormContent);
}}