module uim.cms.views.components.forms.contents.docu;

@safe:
import uim.cms;

class DCMSDocuFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSDocuFormContent", true));
}
mixin(FormComponentCalls!("CMSDocuFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSDocuFormContent(myForm));
}}