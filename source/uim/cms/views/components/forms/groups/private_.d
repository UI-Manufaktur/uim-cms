module uim.cms.views.components.forms.groups.private_;

@safe:
import uim.cms;

class DCMSPrivateFormInput : DSwitchFormInput {
  mixin(FormComponentThis!("entity_private"));  // not CMSPrivateFormInput!
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override void initialize() {
    super.initialize;

    this
    .id("entity_private")
    .inputName("entity_private")
    .fieldName("isPrivate")
    .label("Privat"); 
  }
}
mixin(FormComponentCalls!("CMSPrivateFormInput"));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
