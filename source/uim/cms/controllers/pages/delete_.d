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
}
mixin(APPPageControllerCalls!("CMSDeletePageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSDeletePageController);
    assert(CMSDeletePageController);
}}