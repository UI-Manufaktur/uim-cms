module uim.cms.controllers.pages.themes.create;

@safe:
import uim.cms;

class DCMSThemesCreatePageController : DCMSCreatePageController {
  mixin(APPPageControllerThis!("CMSThemesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
    .scripts.addContents(
      editorSummary~
      editorText,
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
mixin(APPPageControllerCalls!("CMSThemesCreatePageController"));
