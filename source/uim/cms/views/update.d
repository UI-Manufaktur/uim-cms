module uim.cms.views.update;

@safe:
import uim.cms;

class DCMSUpdateView : DAPPView {
  mixin(APPViewThis!("CMSUpdateView"));
}
mixin(APPViewCalls!("CMSUpdateView"));
