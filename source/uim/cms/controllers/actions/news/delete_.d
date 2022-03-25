module uim.cms.controllers.actions.news.delete_;

@safe:
import uim.cms;

class DCMSNewsDeleteAction : DCMSDeleteAction {
  mixin(APPControllerThis!("CMSNewsDeleteAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/news") 
    .collectionName("news"); 
  }
}
mixin(APPControllerCalls!("CMSNewsDeleteAction"));
