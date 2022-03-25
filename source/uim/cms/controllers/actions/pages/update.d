module uim.cms.controllers.actions.pages.update;

@safe:
import uim.cms;

class DCMSPageUpdateAction : DCMSUpdateAction {
  mixin(APPControllerThis!("CMSPageUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/pages") 
    .collectionName("cms_pages"); 
  }
}
mixin(APPControllerCalls!("CMSPageUpdateAction"));
