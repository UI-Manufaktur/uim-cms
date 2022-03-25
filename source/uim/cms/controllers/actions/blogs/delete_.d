module uim.cms.controllers.actions.blogs.delete_;

@safe:
import uim.cms;

class DCMSBlogDeleteAction : DCMSBlogAction {
  mixin(APPControllerThis!("CMSBlogDeleteAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogDeleteAction~":DCMSBlogDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = CMSBlog.fromRequest(options);  
    database[appSession.site, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("CMSBlogDeleteAction"));
