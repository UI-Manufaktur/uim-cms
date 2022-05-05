module uim.cms.views.components.forms.posts.tutorials;

@safe:
import uim.cms;

class DCMSTutorialForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSTutorialForm", true));
}
mixin(ViewComponentCalls!("CMSTutorialForm", true));

