module uim.cms.views.components.forms.bodies.tutorial;

@safe:
import uim.cms;

class DCMSTutorialFormContent : DCMSPostFormContent {
  mixin(FormComponentThis!("CMSTutorialFormContent", true));

  /* override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (form) {
      this.crudMode(form.crudMode);

      if (auto formWithEntity = cast(IAPPWithEntity)form) {
        auto entity = formWithEntity.entity;
        if (entity) switch(field) {
          case "maintitle": return CMSFormGroupMainTitle(form).entity(entity).toH5(options);
          case "subtitle":  return CMSFormGroupSubTitle(form).entity(entity).toH5(options);
          case "keywords":  return CMSFormGroupKeywords(form).entity(entity).toH5(options);
          case "image":     return CMSFormGroupImage(form).entity(entity).toH5(options);
          case "summary":   return CMSFormGroupSummary(form).entity(entity).toH5(options);
          case "themes":    return CMSFormGroupTheme(form).entity(entity).themes(form ? (cast(DCMSPostForm)form).themes : null).toH5(options);
          case "text":      return CMSFormGroupText(form).entity(entity).toH5(options);
      /*       auto entitys = repository.find("entitys").map!(a => CMSTutorial(a)).array;
      , "readonly":"readonly", "value":entity.entity.toString], options
      DH5Obj[] options;
      options ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No entity");
      foreach(entity; entitys) {
        if (entity.entity == entity.id) options ~= H5Option(["selected":"selected", "value":entity.id.toString], entity.display);
        else options ~= H5Option(["value":entity.id.toString], entity.display);
      }
      results ~= BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Tutorial"),
        BS5Col(["col"], 
          H5Select("entity", ["form-select"], ["name":"entity_entity", "readonly":"readonly", "value":entity.entity.toString], options))); * /
          default: return super.formGroup(field, readonly, options); 
        }
      }
    }
    return null;
  } */
}
mixin(FormComponentCalls!("CMSTutorialFormContent", true));

version(test_uim_cms) {
  unittest {
    assert(CMSTutorialFormContent);
}}
