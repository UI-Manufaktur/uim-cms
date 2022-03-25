module uim.cms.controllers.actions.docus.action;


@safe:
import uim.cms;

class DCMSDocuAction : DCMSAction {
 mixin(APPControllerThis!("CMSDocuAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/docus") 
    .collectionName("docus"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocuAction~":DCMSDocuAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSDocuAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSDocuAction);
  }
}