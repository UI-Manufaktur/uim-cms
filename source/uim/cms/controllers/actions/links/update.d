module uim.cms.controllers.actions.links.update;

@safe:
import uim.cms;

class DCMSLinkUpdateAction : DCMSUpdateAction {
  mixin(APPControllerThis!("CMSLinkUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/links") 
    .collectionName("cms_links"); 
  }
}
mixin(APPControllerCalls!("CMSLinkUpdateAction"));
