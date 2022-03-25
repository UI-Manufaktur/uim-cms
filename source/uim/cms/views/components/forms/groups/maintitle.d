module uim.cms.views.components.forms.groups.mainTitle;

@safe:
import uim.cms;

class DCMSFormGroupMainTitle : DAPPTextFormGroup {
  mixin(FormComponentThis!("CMSFormGroupMainTitle", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_mainTitle")
    .name("entity_mainTitle")
    .fieldName("mainTitle")
    .label("Überschrift"); 
  }
}
mixin(FormComponentCalls!("CMSFormGroupMainTitle", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}