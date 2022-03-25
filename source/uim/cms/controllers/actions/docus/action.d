module uim.cms.controllers.actions.docus.action;


@safe:
import uim.cms;

class DCMSDocuAction : DCMSAction {
 mixin(APPControllerThis!("CMSDocuAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/docus") 
      .collectionName("cms_docus"); 
  }
}
mixin(APPControllerCalls!("CMSDocuAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSDocuAction);
  }
}