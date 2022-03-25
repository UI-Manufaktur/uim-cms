module uim.cms.controllers.pages.create;

@safe:
import uim.cms;

class DCMSCreatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSCreatePageController"));

  override void initialize() {
    super.initialize;
    
/*     this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Erstellen")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, APPCheckDatabaseExists])
    // .securityController(APPSecurityController(this))      
    .view(
      CMSCreateView
        .header(
          APPCreatePageHeader(pgPath, myEntities, myEntity).actions(["refresh", "list"])
          .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
            .link(["href":"/"], "UIM!CMS")
            .link(["href":pgPath], myEntities)
            .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Erstellen"))))
    )
    .scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/create.js");

    this.scripts.addContents(editorSummary~editorText);
 */  }
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override void jsCode(STRINGAA options = null) {
    super.jsCode(options);
    if (viewMode == ViewModes.JS) 
      addToPageScript(options, 
      `window.addEventListener('load', (event) => {
        setThemes('`~"session.id.toString"~`', '');
        document.getElementById("entityForm").addEventListener("submit", event => {
          event.preventDefault();
          editorSummary.save();
          editorText.save();
          createEntity();
        })
      });`);
    else 
      addToPageScript(options, 
        `window.addEventListener('load', (event) => {
          setThemes('`~"(session ? session.id.toString : \"\")"~`', '');
            document.getElementById("entityForm").addEventListener("submit", event => {
            editorSummary.save();
            editorText.save();
          })
        });`);
  }
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override void beforeResponse(STRINGAA reqParameters) {
    // debugMethodCall(moduleName!DCMSCreatePageController~":DCMSCreatePageController::beforeResponse");
    super.beforeResponse(reqParameters);   
    if ("redirect" in reqParameters) return;

    auto appSession = getAppSession(reqParameters);
    // debug writeln(appSession.debugInfo); 
      
    auto site = appSession.site;
    // debug writeln(moduleName!DCMSCreatePageController~":DCMSCreatePageController::beforeResponse - Looking for entities in ", site.name, ":", collectionName);

    auto poolId = uniform(1, 1_000_000_000);
    if (auto ent = database[site.name, collectionName].createFromTemplate) entityPool[poolId] = ent;
    reqParameters["poolId"] = to!string(poolId);
  }
}
mixin(APPPageControllerCalls!("CMSCreatePageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSCreatePageController);
    assert(CMSCreatePageController);
}}