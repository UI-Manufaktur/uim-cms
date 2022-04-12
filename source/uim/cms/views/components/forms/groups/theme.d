module uim.cms.views.components.forms.groups.theme;

@safe:
import uim.cms;

class DCMSFormGroupTheme : DFormGroup {
  mixin(FormComponentThis!("CMSFormGroupTheme", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_theme")
    .name("entity_theme")
    .inputName("entity_theme")
    .fieldName("themeId")
    .label("Thema"); 
  }
  mixin(SProperty!("DOOPEntity[]", "themes"));

  DETBBase _database; 
  O database(this O)(DETBBase aDatabase) { 
    _database = aDatabase; 
    return cast(O)this; }

  DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.form && this.form.database) { return this.form.database; } // owner class has database
    return null; // no database found
  }

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options);

    if (this.database) {
      this.themes(database["uim", "cms_themes"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && themes) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No theme");
      selectOptions ~= themes.map!(theme => (entity[fieldName] == theme.id.toString) 
        ? H5Option(["selected":"selected", "value":theme.id.toString], theme.display)
        : H5Option(["value":theme.id.toString], theme.display)).array.toH5;
    }

    auto input = H5Select(name, ["form-select"], ["name":inputName, "readonly":"readonly", "value":entity["theme"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["theme"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("CMSFormGroupTheme", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
