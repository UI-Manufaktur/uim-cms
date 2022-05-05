module uim.cms.views.components.forms.posts.pages;

@safe:
import uim.cms;

class DCMSPageForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSPageForm", true));
}
mixin(ViewComponentCalls!("CMSPageForm", true));

