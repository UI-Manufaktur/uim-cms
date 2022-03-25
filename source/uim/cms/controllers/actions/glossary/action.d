module uim.cms.controllers.actions.glossary.action;


@safe:
import uim.cms;

class DCMSGlossaryAction : DCMSAction {
 mixin(APPControllerThis!("CMSGlossaryAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/cms/glossary") 
    .collectionName("cms_glossary"); 
  }
}
mixin(APPControllerCalls!("CMSGlossaryAction"));

version(test_uim_cms) {
  unittest {
    testController(CMSGlossaryAction);
  }
}