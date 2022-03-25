module uim.cms.controllers.pages.delete_;

@safe:
import uim.cms;

class DCMSDeletePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSDeletePageController"));

/*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Löschen")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    .header(
      APPDeletePageHeader
      .rootPath(pgPath)// .mainTitle(myEntities)// .subTitle("Löschen "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Löschen"))));

    this.scripts.addLinks(        
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/delete.js");

    this.scripts.addContents(editorSummary~editorText);
  }
 */  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsUpdatePageController~":DCMSBlogsUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (auto appSession = getAppSession(options)) {
      debug writeln("In DCMSCreateDCMSCreatePageControllerAction: appSession "~(appSession ? appSession.id : null));
      if (auto tenant = database[appSession.site]) {
        debug writeln("In DCMSCreatePageController: tenant "/* ~tenant.name */);

        if (auto collection = tenant[collectionName]) {
          debug writeln("In DCMSCreatePageController: collection "~collectionName);

          auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
          if (entityId.isUUID) {  
            if (auto entity = collection.findOne(UUID(entityId))) {
              if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
                entityView
                  .entity(entity)
                  .crudMode(CRUDModes.Delete)
                  .rootPath(this.rootPath)
                  .readonly(true);
              }
            }
          }
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("CMSDeletePageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSDeletePageController);
    assert(CMSDeletePageController);
}}