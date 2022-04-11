module uim.cms.views.components.forms.groups.subtitle;

@safe:
import uim.cms;

class DCMSFormGroupSubTitle : DAPPTextFormGroup {
  mixin(FormComponentThis!("CMSFormGroupSubTitle", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_subTitle")
    .name("entity_subTitle")
    .inputName("entity_subTitle")
    .fieldName("subTitle")
    .label("Untertitle"); 
  }
}
mixin(FormComponentCalls!("CMSFormGroupSubTitle", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}

