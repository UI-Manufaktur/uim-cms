module uim.cms.controllers.actions.links.create;

@safe:
import uim.cms;

class DCMSLinkCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSLinkCreateAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/links") 
      .collectionName("cms_links"); 
  }
}
mixin(APPControllerCalls!("CMSLinkCreateAction"));
