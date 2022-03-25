module uim.cms.views.components.forms.contents.page;

@safe:
import uim.cms;

class DCMSPageFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSPageFormContent", true));
}
mixin(FormComponentCalls!("CMSPageFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSPageFormContent);
}}
