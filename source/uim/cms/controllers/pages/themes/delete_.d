module uim.cms.controllers.pages.themes.delete_;

@safe:
import uim.cms;

class DCMSThemesDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSThemesDeletePageController"));

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
mixin(APPPageControllerCalls!("CMSThemesDeletePageController"));