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

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSCreatePageController~":DCMSCreatePageController::beforeResponse");
    super.beforeResponse(options);   
    if (hasError || "redirect" in options) { return; }    

    if (auto appSession = getAppSession(options)) {
      debug writeln("In DCMSCreateDCMSCreatePageControllerAction: appSession "~(appSession ? appSession.id : null));
      if (auto tenant = database[appSession.site]) {
        debug writeln("In DCMSCreatePageController: tenant "/* ~tenant.name */);

        if (auto collection = tenant[collectionName]) {
          debug writeln("In DCMSCreatePageController: collection "~collectionName);

          if (auto entity = collection.createFromTemplate) {                            
            if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
              entityView
                .entity(entity)
                .crudMode(CRUDModes.Create)
                .rootPath(this.rootPath)
                .readonly(true);
            }          
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSCreatePageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSCreatePageController);
    assert(CMSCreatePageController);
}}