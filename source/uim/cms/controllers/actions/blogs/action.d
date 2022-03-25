module uim.cms.controllers.actions.blogs.action;


@safe:
import uim.cms;

class DCMSBlogAction : DCMSAction {
 mixin(APPControllerThis!("CMSBlogAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/blogs") 
      .collectionName("blogs"); 
  }
}
mixin(APPControllerCalls!("CMSBlogAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSBlogAction);
  }
}