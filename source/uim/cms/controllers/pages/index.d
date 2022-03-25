module uim.cms.controllers.pages.index;

@safe:
import uim.cms;

class DCMSIndexPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSIndexPageController"));

  override void initialize() {
    super.initialize;

    this
    .checks([APPCheckAppSessionHasSession]);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSIndexPageController~":DCMSIndexPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    // APPCheckAppSessionHasSiteId(this).check(_request, _response, reqParameters);

    if (auto appSession = getAppSession(options)) {      
      debug writeln(appSession.debugInfo);
      auto session = appSession.session; 
      auto site    = appSession.site;

      if (site) { // selected site
        debug writeln("Has Site", site.id, "/", site.name);
        session["siteId"] = site.id.toString;
        this.view(
          CMSIndexWithSiteView(this)
          .site(site)
          .layout(this.layout));
      }
      else {
        debug writeln("No Site");

        auto dbSites = database ? database["systems", "system_sites"].findMany : null;
        debug writeln("Found sites = ", dbSites.length);

        this.view(
          CMSIndexNoSiteView(this)
          .sites(dbSites)
          .layout(this.layout));
      }
    }
    else {
      debug writeln("No AppSession");
    }
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSIndexPageController~":DCMSIndexPageController::afterResponse");
    if (this.session) this.session.save;
  }

}
mixin(APPPageControllerCalls!("CMSIndexPageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSIndexPageController);
    assert(CMSIndexPageController);
  }
} 