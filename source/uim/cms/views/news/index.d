module uim.cms.views.news.index;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSNewsIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "News")
    );

    auto headerTitle = titleList("News");
    auto bodyTitle = "Gefundene News";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(myRootPath)
          .title(titleView("Übersicht News"))
          .actions([["refresh", "list", "create"]]))
      .form(
        APPEntitiesListForm(this)
          .rootPath(myRootPath) 
          .header(
            FormHeader
              .rootPath(myRootPath)
              .mainTitle("News")
              .subTitle("News anzeigen")
              .actions([["print", "export"]]))
          .content(
            APPListFormContent
              .rootPath(myRootPath)));
        
   }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsIndexView~":DCMSNewsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath("/news")
            .mainTitle("News")
            .subTitle("Übersicht News")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsIndexView~":DCMSNewsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSNewsIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("CMSNewsIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}