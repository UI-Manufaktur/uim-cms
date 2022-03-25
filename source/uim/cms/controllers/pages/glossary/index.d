module uim.cms.controllers.pages.glossary.index;

@safe:
import uim.cms;

class DCMSGlossaryIndexPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSGlossaryIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryIndexView(this));
  }
  
  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSGlossaryIndexPageController~":DCMSGlossaryIndexPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    auto appSession = getAppSession(options);
    if (appSession) {
      if (!appSession.site) { 
        this.error("AppSession missing"); 
        return; }
    }
    else { debug writeln("AppSession missing"); return; }

    auto db = this.database;
    if (db) { debug writeln("Database found"); }
    else { 
      this.error("Database missing"); 
      return; }

    if (auto entitiesView = cast(DAPPEntitiesListView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = db["uim", "cms_glossary"].findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/glossary")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return; }
  }
}
mixin(APPPageControllerCalls!("CMSGlossaryIndexPageController"));