module uim.cms.views.components.forms.inputs.mainTitle;

@safe:
import uim.cms;

class DCMSMainTitleFormInput : DTextFormInput {
  mixin(FormComponentThis!("CMSMainTitleFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_mainTitle")
    .name("entity_mainTitle")
    .inputName("entity_mainTitle")
    .fieldName("mainTitle")
    .label("Überschrift"); 
  }
}
mixin(FormComponentCalls!("CMSMainTitleFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}