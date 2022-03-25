module uim.cms.controllers.pages.update;

@safe:
import uim.cms;

class DCMSUpdatePageController : DCMSPageController {
  mixin(APPPageControllerThis!("CMSUpdatePageController"));

/*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Bearbeiten")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    // .securityController(APPSecurityController(this))
    .header(
      APPEditPageHeader
      .rootPath(pgPath)// .mainTitle(myEntities)// .subTitle("Bearbeiten "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Bearbeiten")))
    );

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/edit.js");

    this.scripts.addContents(editorSummary~editorText);
  } */
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);

    // TODO  setThemes('`~sessionId~`', '');

    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
        document.getElementById("entityForm").addEventListener("submit", event => {
          event.preventDefault();
          editorSummary.save();
          editorText.save();
          editEntity();
        })
      });`);
      else 
        addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
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
}
mixin(APPPageControllerCalls!("CMSUpdatePageController"));

version(test_uim_cms) {
  unittest {
    assert(new DCMSUpdatePageController);
    assert(CMSUpdatePageController);
}}