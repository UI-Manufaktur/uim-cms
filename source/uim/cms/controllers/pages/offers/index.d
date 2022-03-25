module uim.cms.controllers.pages.offers.index;

@safe:
import uim.cms;

class DCMSOffersIndexPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSOffersIndexPageController"));

  override void initialize() {
    super.initialize;
  }
  
  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSOffersIndexPageController~":DCMSOffersIndexPageController::beforeResponse");
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

      auto dbEntities = db["uim", "cms_offers"].findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/offers")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return; }
  }
}
mixin(APPPageControllerCalls!("CMSOffersIndexPageController"));