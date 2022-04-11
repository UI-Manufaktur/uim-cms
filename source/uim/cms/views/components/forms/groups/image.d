module uim.cms.views.components.forms.groups.image;

@safe:
import uim.cms;

class DCMSFormGroupImage : DAPPTextFormGroup {
  mixin(FormComponentThis!("CMSFormGroupImage", true));
  
  override void initialize() {
    super.initialize;

    this
    .id("entity_imagepath")
    .name("entity_imagepath")
    .inputName("entity_imagepath")
    .fieldName("imagePath")
    .label("Titelbild"); 
  }
}
mixin(FormComponentCalls!("CMSFormGroupImage", true));

version(test_uim_cms) {
  unittest {
    // assert(CMSFormGroupImage);
}}