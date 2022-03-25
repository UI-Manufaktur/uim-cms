module uim.cms.controllers.actions.tutorials.action;


@safe:
import uim.cms;

class DCMSTutorialAction : DCMSAction {
 mixin(APPControllerThis!("CMSTutorialAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/tutorials") 
    .collectionName("tutorials"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialAction~":DCMSTutorialAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSTutorialAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSTutorialAction);
  }
}