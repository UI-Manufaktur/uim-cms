module uim.cms.views.tutorials.index;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSTutorialsIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Tutorials")
    );

    auto headerTitle = titleList("Tutorials");
    auto bodyTitle = "Gefundene Tutorials";

    this
      .header(
        PageHeader(this).breadcrumbs(bc)// .rootPath(myRootPath).title(titleView("Übersicht Tutorials")).actions(["refresh", "list", "create"]))
      )
      .form(APPEntitiesListForm(this));// .rootPath(myRootPath));
/*       .form
        .header(FormHeader// .rootPath(myRootPath)// .mainTitle("Tutorials")// .subTitle("Tutorials anzeigen").actions([["print", "export"]]))
        .content(APPListFormContent// .rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsIndexView~":DCMSTutorialsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto frm = cast(DForm)this.form) {
      frm.header(
        FormHeader
        .rootPath("/tutorials")
        .mainTitle("Tutorials")
        .subTitle("Übersicht Tutorials")
        .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsIndexView~":DCMSTutorialsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSTutorialsIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("CMSTutorialsIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}