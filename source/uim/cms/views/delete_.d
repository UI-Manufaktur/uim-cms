module uim.cms.views.delete_;

@safe:
import uim.cms;

class DCMSDeleteView : DAPPView {
  mixin(APPViewThis!("CMSDeleteView"));
}
mixin(APPViewCalls!("CMSDeleteView"));
