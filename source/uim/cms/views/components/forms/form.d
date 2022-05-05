module uim.cms.views.components.forms.form;

@safe:
import uim.cms;

class DCMSForm : DForm {
  mixin(ViewComponentThis!("CMSForm"));

  override void initialize() {
    super.initialize;

    this
      .content(
        CMSFormContent(this));
  }
}
mixin(ViewComponentCalls!("CMSForm"));

