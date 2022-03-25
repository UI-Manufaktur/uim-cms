module uim.cms.views.themes.index;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSThemesIndexView"));

  override void initialize() {
    super.initialize;

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
        .rootPath(myRootPath)
        .title(titleView("Übersicht Themes"))
        .actions([["refresh", "list", "create"]]))
      .form(
        APPEntitiesListForm(this)
          .rootPath(myRootPath)
          .header(
            FormHeader
              .rootPath(myRootPath)
              .mainTitle("Themes")
              .subTitle("Themes anzeigen")
              .actions([["print", "export"]]))
          .content(
            APPListFormContent
              .rootPath(myRootPath)));       
   }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesIndexView~":DCMSThemesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto frm = cast(DForm)this.form) {
      frm.entities(this.entities);
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