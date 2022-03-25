module uim.cms.controllers.actions.news.action;


@safe:
import uim.cms;

class DCMSNewsAction : DCMSAction {
 mixin(APPControllerThis!("CMSNewsAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/news") 
    .collectionName("cms_news"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsAction~":DCMSNewsAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSNewsAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSNewsAction);
  }
}