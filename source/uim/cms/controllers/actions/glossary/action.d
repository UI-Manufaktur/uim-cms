module uim.cms.controllers.actions.glossary.action;


@safe:
import uim.cms;

class DCMSGlossaryAction : DCMSAction {
 mixin(APPControllerThis!("CMSGlossaryAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/glossary") 
    .collectionName("glossary"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryAction~":DCMSGlossaryAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSGlossaryAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSGlossaryAction);
  }
}