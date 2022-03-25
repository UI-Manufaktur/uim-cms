module uim.cms.controllers.actions.news.create;

@safe:
import uim.cms;

class DCMSNewsCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSNewsCreateAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/news") 
      .collectionName("cms_news"); 
  }
}
mixin(APPControllerCalls!("CMSNewsCreateAction"));
