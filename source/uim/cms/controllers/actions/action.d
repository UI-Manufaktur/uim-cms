module uim.cms.controllers.actions.action;

@safe:
import uim.cms;

class DCMSAction : DAPPActionController {
  mixin(APPControllerThis!("CMSAction"));

  override void initialize() {
    super.initialize;

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }
}
mixin(APPControllerCalls!("CMSAction"));

version(test_uim_cms) {
  unittest {
    // TODO
  }
}