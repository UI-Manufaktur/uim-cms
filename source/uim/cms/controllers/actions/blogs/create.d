module uim.cms.controllers.actions.blogs.create;

@safe:
import uim.cms;

class DCMSBlogCreateAction : DCMSBlogAction {
  mixin(APPControllerThis!("CMSBlogCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogCreateAction~":DCMSBlogCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    debug writeln(options);        
    auto tenant = database[appSession.site];
    auto entity = tenant["blogs"].createFromTemplate.fromRequest(options);   
    tenant["blogs"].insertOne(entity);
    debug writeln("entity.id = ", entity.id);

    options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
	}
}
mixin(APPControllerCalls!("CMSBlogCreateAction"));
