module uim.cms.controllers.pages.page;

@safe:
import uim.cms;

class DCMSPageController : DAPPPageController {
  mixin(APPPageControllerThis!("CMSPageController"));
  
  mixin(APPParameter!("entityName"));
  mixin(APPParameter!("rootPath"));

  override void initialize() {
    super.initialize;

    this
    .addChecks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // Check appSesssion
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites // Check database
    ]);
  }
}
mixin(APPPageControllerCalls!("CMSPageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSPageController);
    assert(CMSPage);
}}