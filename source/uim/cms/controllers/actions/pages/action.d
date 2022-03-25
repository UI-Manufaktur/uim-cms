module uim.cms.controllers.actions.pages.action;


@safe:
import uim.cms;

class DCMSPageAction : DCMSAction {
 mixin(APPControllerThis!("CMSPageAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/pages") 
    .collectionName("pages"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPageAction~":DCMSPageAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSPageAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSPageAction);
  }
}