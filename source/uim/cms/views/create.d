module uim.cms.views.create;

@safe:
import uim.cms;

class DCMSCreateView : DAPPView {
  mixin(APPViewThis!("CMSCreateView"));
}
mixin(APPViewCalls!("CMSCreateView"));
