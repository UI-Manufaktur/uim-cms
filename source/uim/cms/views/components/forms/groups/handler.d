module uim.cms.views.components.forms.groups.handler;

@safe:
import uim.cms;

class DCMSFormGroupHandler : DFormGroupHandler {
  mixin(FormComponentThis!("CMSFormGroupHandler", true));

  override void initialize() {
    super.initialize;

    this
      .addFormGroups([
        "private": CMSFormGroupPrivate, 
        "maintitle": CMSFormGroupMainTitle, 
        "subtitle": CMSFormGroupSubTitle, 
        "keywords": CMSFormGroupKeywords, 
        "image": CMSFormGroupImage, 
        "summary": CMSFormGroupSummary, 
        "text": CMSFormGroupText, 
        "themes": CMSFormGroupTheme]);
  } 
}  
mixin(FormComponentCalls!("CMSFormGroupHandler", true));
