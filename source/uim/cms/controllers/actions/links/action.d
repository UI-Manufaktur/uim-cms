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
}
mixin(APPControllerCalls!("CMSLinkAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSLinkAction);
  }
}