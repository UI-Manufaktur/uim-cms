module uim.cms.views.components.forms.posts.form;

@safe:
import uim.cms;

class DCMSPostForm : DCMSForm {
  mixin(ViewComponentThis!("CMSPostForm", true));

  override void initialize() { 
    super.initialize; 
    
    this
      .content(
        CMSPostFormContent(this));
  }

  mixin(OProperty!("DOOPEntity[]", "themes"));
}
mixin(ViewComponentCalls!("CMSPostForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}