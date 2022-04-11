module uim.cms.views.components.forms.themes;

@safe:
import uim.cms;
import models.cms.entities.theme;

class DCMSThemeForm : DForm {
  mixin(ViewComponentThis!("CMSThemeForm"));

  override void initialize() { 
    super.initialize; 
    
    this
      .content(
        CMSThemeFormContent(this));
  }
}
mixin(ViewComponentCalls!("CMSThemeForm"));

version(test_uim_cms) {
  unittest {
    // TODO
}}