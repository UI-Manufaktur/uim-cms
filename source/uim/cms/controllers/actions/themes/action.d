module uim.cms.controllers.actions.themes.action;


@safe:
import uim.cms;

class DCMSThemeAction : DCMSAction {
 mixin(APPControllerThis!("CMSThemeAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/themes") 
    .collectionName("themes"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemeAction~":DCMSThemeAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSThemeAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSThemeAction);
  }
}