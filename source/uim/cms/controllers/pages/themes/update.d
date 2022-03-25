module uim.cms.controllers.pages.themes.update;

@safe:
import uim.cms;

class DCMSThemesUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSThemesUpdatePageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~editorText,
`window.addEventListener('load', (event) => {
  document.getElementById("entityForm").addEventListener("submit", event => {
    editorSummary.save();
    editorText.save();
  })
});`);

    this
      .rootPath("/cms/themes") 
      .collectionName("cms_themes"); 
  }
}
mixin(APPPageControllerCalls!("CMSThemesUpdatePageController"));