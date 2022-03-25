module uim.cms.views.docus.index;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSDocusIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Docus")
    );

    auto headerTitle = titleList("Docus");
    auto bodyTitle = "Gefundene Docus";

    this
      .header(
        PageHeader(this).breadcrumbs(bc)// .rootPath(myRootPath).title(titleView("Übersicht Docus")).actions(["refresh", "list", "create"]))
      )
      .form(
        APPEntitiesListForm(this)// .rootPath(myRootPath));
      );
/*       .form
        .header(FormHeader// .rootPath(myRootPath)// .mainTitle("Docus")// .subTitle("Docus anzeigen").actions([["print", "export"]]))
        .content(APPListFormContent// .rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusIndexView~":DCMSDocusIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath("/docus")
            .mainTitle("Docus")
            .subTitle("Übersicht Docus")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusIndexView~":DCMSDocusIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSDocusIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("CMSDocusIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}