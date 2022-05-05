module uim.cms.views.components.forms.groups.handler;

@safe:
import uim.cms;

class DCMSFormInputHandler : DFormInputHandler {
  mixin(FormComponentThis!("CMSFormInputHandler", true));

  override void initialize() {
    super.initialize;

    this
      .addFormInputs([
        "private": CMSPrivateFormInput, 
        "maintitle": CMSMainTitleFormInput, 
        "subtitle": CMSSubTitleFormInput, 
        "keywords": CMSKeywordsFormInput, 
        "image": CMSImageFormInput, 
        "summary": CMSSummaryFormInput, 
        "text": CMSTextFormInput, 
        "themes": CMSThemesFormInput]);
  } 
}  
mixin(FormComponentCalls!("CMSFormInputHandler", true));
