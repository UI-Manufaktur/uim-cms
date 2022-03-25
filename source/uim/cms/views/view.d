module uim.cms.views.view;

@safe:
import uim.cms;

class DCMSView : DAPPView {
  mixin(APPViewThis!("CMSView"));
}
mixin(APPViewCalls!("CMSView"));

