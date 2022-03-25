module uim.cms.views.components.forms.form;

@safe:
import uim.cms;
import models.cms.entities.demo;

class DCMSForm : DForm {
  mixin(ViewComponentThis!("CMSForm"));

  override void initialize() {
    super.initialize;

    this
      .content(
        CMSFormContent);
  }
}
mixin(ViewComponentCalls!("CMSForm"));

