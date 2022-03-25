module uim.cms.controllers.pages.glossary.update;

@safe:
import uim.cms;

class DCMSGlossaryUpdatePageController : DCMSUpdatePageController {
  mixin(APPPageControllerThis!("CMSGlossaryUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryUpdateView(this))
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
mixin(APPPageControllerCalls!("CMSGlossaryUpdatePageController"));