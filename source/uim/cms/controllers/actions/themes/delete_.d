module uim.cms.controllers.actions.themes.delete_;

@safe:
import uim.cms;

class DCMSThemeDeleteAction : DCMSThemeAction {
  mixin(APPControllerThis!("CMSThemeDeleteAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/themes") 
    .collectionName("cms_themes"); 
  }
}
mixin(APPControllerCalls!("CMSThemeDeleteAction"));
