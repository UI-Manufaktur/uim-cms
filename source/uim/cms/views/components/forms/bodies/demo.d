module uim.cms.views.components.forms.bodies.demo;

@safe:
import uim.cms;

class DCMSDemoFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSDemoFormContent", true));
}
mixin(FormComponentCalls!("CMSDemoFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSDemoFormContent);
}}