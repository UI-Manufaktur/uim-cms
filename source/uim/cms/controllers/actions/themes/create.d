module uim.cms.controllers.actions.themes.create;

@safe:
import uim.cms;

class DCMSThemeCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSThemeCreateAction"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/themes") 
      .collectionName("cms_themes"); 
  }
}
mixin(APPControllerCalls!("CMSThemeCreateAction"));
