module uim.cms.controllers.actions.offers.action;


@safe:
import uim.cms;

class DCMSOfferAction : DCMSAction {
 mixin(APPControllerThis!("CMSOfferAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/offers") 
    .collectionName("offers"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOfferAction~":DCMSOfferAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("CMSOfferAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSOfferAction);
  }
}