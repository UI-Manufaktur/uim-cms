module uim.cms.controllers.actions.themes.update;

@safe:
import uim.cms;

class DCMSThemeUpdateAction : DCMSUpdateAction {
  mixin(APPControllerThis!("CMSThemeUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/themes") 
    .collectionName("cms_themes"); 
  }
}
mixin(APPControllerCalls!("CMSThemeUpdateAction"));
