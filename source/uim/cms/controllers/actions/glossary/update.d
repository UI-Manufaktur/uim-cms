module uim.cms.controllers.actions.glossary.update;

@safe:
import uim.cms;

class DCMSGlossaryUpdateAction : DCMSUpdateAction {
  mixin(APPControllerThis!("CMSGlossaryUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/glossary") 
    .collectionName("cms_glossary"); 
  }
}
mixin(APPControllerCalls!("CMSGlossaryUpdateAction"));
