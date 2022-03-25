module uim.cms.controllers.pages.glossary.create;

@safe:
import uim.cms;

class DCMSGlossaryCreatePageController : DCMSCreatePageController {
  mixin(APPPageControllerThis!("CMSGlossaryCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryCreateView(this))
      .scripts
        .addContents(
          editorSummary~editorText,
    `window.addEventListener('load', (event) => {
      document.getElementById("entityForm").addEventListener("submit", event => {
        editorSummary.save();
        editorText.save();
      })
    });`);

    this
      .rootPath("/cms/glossary") 
      .collectionName("cms_glossary"); 
  }
}
mixin(APPPageControllerCalls!("CMSGlossaryCreatePageController"));
