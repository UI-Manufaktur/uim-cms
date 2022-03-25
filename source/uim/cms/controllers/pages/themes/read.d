module uim.cms.controllers.pages.themes.read;

@safe:
import uim.cms;

class DCMSThemesReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSThemesReadPageController"));

  override void initialize() {
    super.initialize;

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/themes") 
      .collectionName("cms_themes"); 
  }
}
mixin(APPPageControllerCalls!("CMSThemesReadPageController"));