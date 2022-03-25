module uim.cms.controllers.actions.blogs.create;

@safe:
import uim.cms;

class DCMSBlogCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSBlogCreateAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs"); 
  }
}
mixin(APPControllerCalls!("CMSBlogCreateAction"));
