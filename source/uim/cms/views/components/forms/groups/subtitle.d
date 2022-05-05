module uim.cms.views.components.forms.groups.subtitle;

@safe:
import uim.cms;

class DCMSSubTitleFormInput : DTextFormInput {
  mixin(FormComponentThis!("CMSSubTitleFormInput", true));

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
mixin(FormComponentCalls!("CMSSubTitleFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}

