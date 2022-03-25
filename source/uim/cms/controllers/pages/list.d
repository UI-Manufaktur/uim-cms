module uim.cms.controllers.pages.list;

@safe:
import uim.cms;

class DCMSListPageController : DAPPListPage {
  mixin(APPPageControllerThis!("CMSListPageController"));
  
/*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { 
    super(); 

    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities)
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, APPCheckDatabaseExists])
    .header(
      PageHeader
      .rootPath(pgPath).preTitle(myEntities).title("Übersicht "~myEntities).actions(["refresh", "create"])
      .breadcrumbs(
        BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], myEntities)))
    )
    .collectionName(myCollectionName)
    .form(APPEntitiesListForm.rootPath(pgPath));

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/list.js");

  } */
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters, 
      `window.addEventListener("load", event => `~
        jsBlock("listEntities('"~"(session ? session.id.toString : \"\")"~"');")
      ~`)`);
  }
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSListPageController~":DCMSListPageController::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) return; 

    auto appSession = getAppSession(options);

    auto session  = appSession.session;
    auto site     = appSession.site;
      
    // debug writeln(moduleName!DCMSCreatePageController~":DCMSCreatePageController::beforeResponse - Looking for entities in ", site.name, ":", collectionName);
    auto entities = database[site.name, collectionName].findMany;

    auto poolId = uniform(1, 1_000_000_000);
    entitiesPool[poolId] = entities;
    options["poolId"] = to!string(poolId);
  }
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}
}
mixin(APPPageControllerCalls!("CMSListPageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSListPageController);
    assert(CMSListPageController);
}}