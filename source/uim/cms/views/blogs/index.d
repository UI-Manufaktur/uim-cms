module uim.cms.views.blogs.index;

@safe:
import uim.cms;
import uim.cms.views.blogs;

class DCMSBlogsIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSBlogsIndexView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/blogs");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Blogs")
    );

    auto headerTitle = titleList("Blogs");
    auto bodyTitle = "Gefundene Blogs";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .title(titleView("Übersicht Blogs"))
          .actions([["refresh", "list", "create"]])
          .rootPath(this.rootPath)
      )
      .form(
        APPEntitiesListForm(this)
          .header(
            FormHeader
              .mainTitle("Blogs")
              .subTitle("Blogs anzeigen")
              .actions([["print", "export"]]))
          .content(EntitiesFormContent)
          .rootPath(this.rootPath));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsIndexView~":DCMSBlogsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto frm = cast(DForm)this.form) {
      frm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsIndexView~":DCMSBlogsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(myRootPath);
    debug writeln("RootPath in DCMSBlogsIndexView:toH5 -> ", this.rootPath);
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
  }   */
}
mixin(APPViewCalls!("CMSBlogsIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}