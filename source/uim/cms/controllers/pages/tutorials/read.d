module uim.cms.controllers.pages.tutorials.read;

@safe:
import uim.cms;

class DCMSTutorialsReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSTutorialsReadPageController"));

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
mixin(APPPageControllerCalls!("CMSTutorialsReadPageController"));