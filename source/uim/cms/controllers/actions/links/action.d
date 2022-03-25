module uim.cms.controllers.actions.links.action;


@safe:
import uim.cms;

class DCMSLinkAction : DCMSAction {
 mixin(APPControllerThis!("CMSLinkAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/links") 
    .collectionName("links"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinkAction~":DCMSLinkAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSLinkAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSLinkAction);
  }
}