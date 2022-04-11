module uim.cms.views.components.forms.contents.content;

@safe:
import uim.cms;

class DCMSFormContent : DEntityFormContent {
  mixin(FormComponentThis!("CMSFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
    .crudMode(CRUDModes.Read)
    .addFields(["private", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])
    .formGroupHandler(CMSFormGroupHandler); 
  }

/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (form) {
      this.crudMode(form.crudMode);

      if (auto formWithEntity = cast(IAPPWithEntity)form) {
        this.entity(formWithEntity.entity);
        if (entity) switch(field) {
          case "private": return CMSFormGroupPrivate(form).entity(entity).toH5(options);
          case "maintitle": return CMSFormGroupMainTitle(form).entity(entity).toH5(options);
          case "subtitle": return CMSFormGroupSubTitle(form).entity(entity).toH5(options);
          case "keywords": return CMSFormGroupKeywords(form).entity(entity).toH5(options);
          case "image": return CMSFormGroupImage(form).entity(entity).toH5(options);
          case "summary": return CMSFormGroupSummary(form).entity(entity).toH5(options);
          case "text": return CMSFormGroupText(form).entity(entity).toH5(options);
          default: return super.formGroup(field, readonly, options);
        }
      }
    }
    return null;
  } */
}
mixin(FormComponentCalls!("CMSFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSFormContent(myForm));
}}
