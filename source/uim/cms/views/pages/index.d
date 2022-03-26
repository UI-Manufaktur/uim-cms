module uim.cms.views.pages.index;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSPagesIndexView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/pages");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Pages")
    );

    auto headerTitle = titleList("Pages");
    auto bodyTitle = "Gefundene Pages";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .title(titleView("Übersicht Pages"))
          .actions([["refresh", "list", "create"]])
          .rootPath(this.rootPath)
      )
      .form(
        APPEntitiesListForm(this)
          .header(
            FormHeader
              .mainTitle("Pages")
              .subTitle("Pages anzeigen")
              .actions([["print", "export"]]))
          .content(EntitiesFormContent)
          .rootPath(this.rootPath));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesIndexView~":DCMSPagesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath("/pages")
            .mainTitle("Pages")
            .subTitle("Übersicht Pages")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesIndexView~":DCMSPagesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSPagesIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("CMSPagesIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}