module uim.cms.controllers.actions.pages.delete_;

@safe:
import uim.cms;

class DCMSPageDeleteAction : DCMSDeleteAction {
  mixin(APPControllerThis!("CMSPageDeleteAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/pages") 
    .collectionName("cms_pages"); 
  }
}
mixin(APPControllerCalls!("CMSPageDeleteAction"));
