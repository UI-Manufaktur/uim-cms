module uim.cms.controllers.actions.tutorials.create;

@safe:
import uim.cms;

class DCMSTutorialCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSTutorialCreateAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/tutorials") 
      .collectionName("cms_tutorials"); 
  }
}
mixin(APPControllerCalls!("CMSTutorialCreateAction"));
