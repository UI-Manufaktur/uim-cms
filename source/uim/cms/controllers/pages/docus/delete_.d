module uim.cms.controllers.pages.docus.delete_;

@safe:
import uim.cms;

class DCMSDocusDeletePageController : DCMSDeletePageController {
  mixin(APPPageControllerThis!("CMSDocusDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSDocusDeleteView(this))
      .scripts.addContents(
        editorSummary~editorText~
        "editorSummary.disabled();"~
        "editorText.disabled();"
      );

    this
    .rootPath("/cms/docus") 
    .collectionName("cms_docus"); 
  }
}
mixin(APPPageControllerCalls!("CMSDocusDeletePageController"));