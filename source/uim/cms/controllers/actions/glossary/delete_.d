module uim.cms.controllers.actions.glossary.delete_;

@safe:
import uim.cms;

class DCMSGlossaryDeleteAction : DCMSDeleteAction {
  mixin(APPControllerThis!("CMSGlossaryDeleteAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/glossary") 
    .collectionName("cms_glossary"); 
  }
}
mixin(APPControllerCalls!("CMSGlossaryDeleteAction"));
