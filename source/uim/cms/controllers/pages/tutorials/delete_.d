module uim.cms.controllers.pages.tutorials.delete_;

@safe:
import uim.cms;

class DCMSTutorialsDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSTutorialsDeletePageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/tutorials") 
      .collectionName("cms_tutorials"); 
  }
}
mixin(APPPageControllerCalls!("CMSTutorialsDeletePageController"));