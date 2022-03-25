module uim.cms.views.components.forms.posts.pages;

@safe:
import uim.cms;
import models.cms.entities.page;

class DCMSPageForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSPageForm", true));
}
mixin(ViewComponentCalls!("CMSPageForm", true));

