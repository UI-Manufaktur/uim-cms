module uim.cms.views.components.forms.groups.text;

@safe:
import uim.cms;

class DCMSFormGroupText : DAPPTextAreaFormGroup {
  mixin(FormComponentThis!("CMSFormGroupText", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_text")
    .name("entity_text")
    .inputName("entity_text")
    .fieldName("text")
    .label("Inhalt");
  }
}
mixin(FormComponentCalls!("CMSFormGroupText", true));

version(test_uim_cms) {
  unittest {
    assert(CMSFormGroupText);
}}
