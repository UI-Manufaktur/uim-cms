module uim.cms.controllers.pages.glossary.delete_;

@safe:
import uim.cms;

class DCMSGlossaryDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSGlossaryDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSGlossaryDeleteView(this))
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
mixin(APPPageControllerCalls!("CMSGlossaryDeletePageController"));