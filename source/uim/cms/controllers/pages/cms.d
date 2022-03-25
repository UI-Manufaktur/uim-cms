module uim.cms.controllers.pages.cms;

@safe:
import uim.cms;

class DCMSCmsPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSCmsPageController"));

  override void initialize() {
    super.initialize;
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSCmsPageController~":DCMSCmsPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    if (database) {
      auto blogs = database["uim", "cms_sites"].findMany;
      auto docus = database["uim", "cms_docus"].findMany;
      auto glossary = database["uim", "cms_glossary"].findMany;
      auto news = database["uim", "cms_news"].findMany;
      auto links = database["uim", "cms_links"].findMany;
    }    
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSCmsPageController~":DCMSCmsPageController::afterResponse");
    super.afterResponse(options);
  }

}
mixin(APPPageControllerCalls!("CMSCmsPageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSCmsPageController);
    assert(CMSCmsPageController);
  }
} 