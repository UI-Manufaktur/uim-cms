module uim.cms.controllers.actions.tutorials.update;

@safe:
import uim.cms;

class DCMSTutorialUpdateAction : DCMSUpdateAction {
  mixin(APPControllerThis!("CMSTutorialUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/tutorials") 
    .collectionName("cms_tutorials"); 
  }
}
mixin(APPControllerCalls!("CMSTutorialUpdateAction"));
