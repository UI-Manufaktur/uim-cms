module uim.cms.views.list;

@safe:
import uim.cms;

class DCMSListView : DAPPView {
  mixin(APPViewThis!("CMSListView"));
}
mixin(APPViewCalls!("CMSListView"));
