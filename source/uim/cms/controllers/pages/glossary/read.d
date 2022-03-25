module uim.cms.controllers.pages.glossary.read;

@safe:
import uim.cms;

class DCMSGlossaryReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSGlossaryReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryReadView(this))
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

    this
      .rootPath("/cms/glossary") 
      .collectionName("cms_glossary"); 
  }
}
mixin(APPPageControllerCalls!("CMSGlossaryReadPageController"));