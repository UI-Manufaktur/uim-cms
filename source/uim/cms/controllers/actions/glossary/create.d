module uim.cms.controllers.actions.glossary.create;

@safe:
import uim.cms;

class DCMSGlossaryCreateAction : DCMSCreateAction {
  mixin(APPControllerThis!("CMSGlossaryCreateAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/glossary") 
    .collectionName("cms_glossary"); 
  }
}
mixin(APPControllerCalls!("CMSGlossaryCreateAction"));
