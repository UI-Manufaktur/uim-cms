module uim.cms.controllers.actions.pages.create;

@safe:
import uim.cms;

class DCMSPageCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSPageCreateAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/pages") 
      .collectionName("cms_pages"); 
  }
}
mixin(APPControllerCalls!("CMSPageCreateAction"));
