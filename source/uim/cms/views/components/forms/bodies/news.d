module uim.cms.views.components.forms.bodies.news;

@safe:
import uim.cms;

class DCMSNewsItemFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSNewsItemFormContent", true));
}
mixin(FormComponentCalls!("CMSNewsItemFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSNewsItemFormContent);
  }
}
