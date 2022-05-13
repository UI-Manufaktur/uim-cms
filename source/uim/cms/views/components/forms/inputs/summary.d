module uim.cms.views.components.forms.inputs.summary;

@safe:
import uim.cms;

class DCMSSummaryFormInput : DTextAreaFormInput {
  mixin(FormComponentThis!("CMSSummaryFormInput", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_summary")
    .name("entity_summary")
    .inputName("entity_summary")
    .fieldName("summary")
    .label("Zusammenfassung");  
  }
}
mixin(FormComponentCalls!("CMSSummaryFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
