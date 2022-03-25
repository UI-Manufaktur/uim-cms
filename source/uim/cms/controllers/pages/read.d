module uim.cms.controllers.pages.read;

@safe:
import uim.cms;

class DCMSReadPageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSReadPageController"));

/*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Anzeigen")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    // .securityController(APPSecurityController(this))      
    .header(
      APPViewPageHeader
      .rootPath(pgPath)// .mainTitle(myEntities)// .subTitle("Anzeigen "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Anzeigen")))
    );

    this
      .scripts
        .addLinks(        
          "/js/apps/"~jsPath~"/entity.js",
          "/js/apps/"~jsPath~"/view.js");

    this
      .scripts
        .addContents(editorSummary~editorText);

  }
 */  
  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters, 
    `
window.addEventListener('load', (event) => {
      setThemes('`~"(session ? session.id.toString : \"\")"~`', '');
      editorSummary.disabled(true);
      editorText.disabled(true);
      document.getElementById("entityForm").addEventListener("submit", event => {
        event.preventDefault();
        viewEntity();
      })
    });`);
else addToPageScript(reqParameters, 
`window.addEventListener('load', (event) => {
  editorSummary.disabled(true);
  editorText.disabled(true);
  setThemes('`~"(session ? session.id.toString : \"\")"~`', '`~"entity.theme.toString"~`');
});`); 

  }

  override void beforeResponse(STRINGAA reqParameters) {
    // debugMethodCall(moduleName!DCMSReadPageController~":DCMSReadPageController:beforeResponse(req, res)");
    super.beforeResponse(reqParameters);       
    if ("redirect" in reqParameters) return; 

    auto appSession = getAppSession(reqParameters);
  
    auto selector = reqParameters.toEntitySelect;
    // debug writeln(moduleName!DCMSReadPageController~":DCMSReadPageController::beforeResponse - Reading entity for selector ", selector);
    auto entity = database[appSession.site.name, collectionName].findOne(selector);
  }
}
mixin(APPPageControllerCalls!("CMSReadPageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSReadPageController);
    assert(CMSReadPageController);
}}