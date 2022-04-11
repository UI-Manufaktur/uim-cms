module uim.cms.views.components.forms.groups.summary;

@safe:
import uim.cms;

class DCMSFormGroupSummary : DAPPTextAreaFormGroup {
  mixin(FormComponentThis!("CMSFormGroupSummary", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_summary")
    .name("entity_summary")
    .inputName("entity_summary")
    .fieldName("summary")
    .label("Zusammenfassung"); ; 
  }
}
mixin(FormComponentCalls!("CMSFormGroupSummary", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
