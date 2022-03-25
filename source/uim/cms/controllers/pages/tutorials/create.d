module uim.cms.controllers.pages.tutorials.create;

@safe:
import uim.cms;

class DCMSTutorialsCreatePageController : DCMSCreatePageController {
  mixin(APPPageControllerThis!("CMSTutorialsCreatePageController"));

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
      .rootPath("/cms/tutorials") 
      .collectionName("cms_tutorials"); 
  }
}
mixin(APPPageControllerCalls!("CMSTutorialsCreatePageController"));
