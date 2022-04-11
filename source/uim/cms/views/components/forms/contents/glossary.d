module uim.cms.views.components.forms.contents.glossary;

@safe:
import uim.cms;

class DCMSGlossaryItemFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSGlossaryItemFormContent", true));
}
mixin(FormComponentCalls!("CMSGlossaryItemFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSGlossaryItemFormContent(myForm));
}}