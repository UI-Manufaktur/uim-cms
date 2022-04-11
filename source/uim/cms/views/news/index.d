module uim.cms.views.news.index;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSNewsIndexView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/news");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/cms"], "CMS")
      .item(["href":this.rootPath], "News")
    );

    auto headerTitle = titleList("News");
    auto bodyTitle = "Gefundene News";

    auto myForm = APPEntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("News")
          .subTitle("News anzeigen")
          .actions([["print", "export"]]));
    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .title(titleView("Übersicht TuNewstorials"))
          .actions([["refresh", "list", "create"]])
          .rootPath(this.rootPath)
      )
      .form(
        myForm
          .content(EntitiesFormContent(myForm))
          .rootPath(this.rootPath));
   }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsIndexView~":DCMSNewsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
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