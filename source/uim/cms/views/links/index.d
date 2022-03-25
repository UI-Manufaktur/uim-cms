module uim.cms.views.links.index;

@safe:
import uim.cms;
import uim.cms.views.links;

class DCMSLinksIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSLinksIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Links")
    );

    auto headerTitle = titleList("Links");
    auto bodyTitle = "Gefundene Links";

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleView("Übersicht Links"))
        .actions([["refresh", "list", "create"]]);
    }

/*       .form(
        APPEntitiesListForm
          .rootPath(myRootPath));
 */
/*       .form
        .header(FormHeader// .rootPath(myRootPath)// .mainTitle("Links")// .subTitle("Links anzeigen").actions([["print", "export"]]))
        .content(APPListFormContent// .rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksIndexView~":DCMSLinksIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath("/links")
            .mainTitle("Links")
            .subTitle("Übersicht Links")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksIndexView~":DCMSLinksIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSLinksIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("CMSLinksIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}