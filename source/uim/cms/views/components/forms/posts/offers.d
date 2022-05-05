module uim.cms.views.components.forms.posts.offers;;

@safe:
import uim.cms;

class DCMSOfferForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSOfferForm", true));
}
mixin(ViewComponentCalls!("CMSOfferForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}