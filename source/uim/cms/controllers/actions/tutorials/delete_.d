module uim.cms.controllers.actions.tutorials.delete_;

@safe:
import uim.cms;

class DCMSTutorialDeleteAction : DCMSDeleteAction {
  mixin(APPControllerThis!("CMSTutorialDeleteAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/tutorials") 
    .collectionName("cms_tutorials"); 
  }
}
mixin(APPControllerCalls!("CMSTutorialDeleteAction"));
