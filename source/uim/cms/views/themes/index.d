module uim.cms.views.themes.index;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSThemesIndexView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/themes");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Themes")
    );

    auto headerTitle = titleList("Themes");
    auto bodyTitle = "Gefundene Themes";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .title(titleView("Übersicht Themes"))
          .actions([["refresh", "list", "create"]])
          .rootPath(this.rootPath)
      )
      .form(
        APPEntitiesListForm(this)
          .header(
            FormHeader
              .mainTitle("Themes")
              .subTitle("Themes anzeigen")
              .actions([["print", "export"]]))
          .content(EntitiesFormContent(myForm))
          .rootPath(this.rootPath));     
   }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesIndexView~":DCMSThemesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesIndexView~":DCMSThemesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSThemesIndexView:toH5 -> ", this.rootPath);
    debug writeln("this.form.rootPath(",this.rootPath,")");

    return [
      H5Div(["content"],
        H5Div(["container-xl"], 
          BS5Row("messages", [""]),
          BS5Row(["row-deck row-cards"], 
          this.form
          .rootPath(this.rootPath)
          .entities(this.entities)
          .toH5(options)
    )))].toH5;              
  }  */
}
mixin(APPViewCalls!("CMSThemesIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}