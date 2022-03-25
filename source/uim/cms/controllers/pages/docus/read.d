module uim.cms.controllers.pages.docus.read;

@safe:
import uim.cms;

class DCMSDocusReadPageController : DCMSReadPageController {
  mixin(APPPageControllerThis!("CMSDocusReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        CMSDocusReadView(this))
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

    this
      .rootPath("/cms/docus") 
      .collectionName("cms_docus"); 
  }
}
mixin(APPPageControllerCalls!("CMSDocusReadPageController"));