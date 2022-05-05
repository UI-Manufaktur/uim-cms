module uim.cms.views.components.forms.groups.handler;

@safe:
import uim.cms;

class DCMSFormInputHandler : DFormInputHandler {
  mixin(FormComponentThis!("CMSFormInputHandler", true));

  override void initialize() {
    super.initialize;

    this
      .addFormInputs([
        "private": CMSFormInputPrivate, 
        "maintitle": CMSFormInputMainTitle, 
        "subtitle": CMSFormInputSubTitle, 
        "keywords": CMSFormInputKeywords, 
        "image": CMSFormInputImage, 
        "summary": CMSFormInputSummary, 
        "text": CMSFormInputText, 
        "themes": CMSFormInputTheme]);
  } 
}  
mixin(FormComponentCalls!("CMSFormInputHandler", true));
