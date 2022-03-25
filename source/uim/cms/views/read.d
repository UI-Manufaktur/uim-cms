module uim.cms.views.read;

@safe:
import uim.cms;

class DCMSReadView : DAPPView {
  mixin(APPViewThis!("CMSReadView"));
}
mixin(APPViewCalls!("CMSReadView"));
