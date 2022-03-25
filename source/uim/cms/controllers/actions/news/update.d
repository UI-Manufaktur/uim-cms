module uim.cms.controllers.actions.news.update;

@safe:
import uim.cms;

class DCMSNewsUpdateAction : DCMSUpdateAction {
  mixin(APPControllerThis!("CMSNewsUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/news") 
    .collectionName("news"); 
  }
}
mixin(APPControllerCalls!("CMSNewsUpdateAction"));
