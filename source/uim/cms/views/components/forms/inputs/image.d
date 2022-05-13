module uim.cms.views.components.forms.inputs.image;

@safe:
import uim.cms;

class DCMSImageFormInput : DTextFormInput {
  mixin(FormComponentThis!("CMSImageFormInput", true));
  
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
mixin(FormComponentCalls!("CMSImageFormInput", true));

version(test_uim_cms) {
  unittest {
    // assert(CMSImageFormInput);
}}