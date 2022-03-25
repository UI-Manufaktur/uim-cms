module uim.cms.controllers.actions.links.delete_;

@safe:
import uim.cms;

class DCMSLinkDeleteAction : DCMSDeleteAction {
  mixin(APPControllerThis!("CMSLinkDeleteAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/links") 
    .collectionName("cms_links"); 
  }
}
mixin(APPControllerCalls!("CMSLinkDeleteAction"));
