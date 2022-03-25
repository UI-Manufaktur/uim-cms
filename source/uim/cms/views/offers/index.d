module uim.cms.views.offers.index;

@safe:
import uim.cms;
import uim.cms.views.offers;

class DCMSOffersIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSOffersIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Offers")
    );

    auto headerTitle = titleList("Offers");
    auto bodyTitle = "Gefundene Offers";

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(myRootPath)
          .title(titleView("Übersicht Offers"))
          .actions([["refresh", "list", "create"]]))      
      .form(
        APPEntitiesListForm(this)
          .rootPath(myRootPath)
          .header(
            FormHeader
              .rootPath(myRootPath)
              .mainTitle("Offers")
              .subTitle("Offers anzeigen")
              .actions([["print", "export"]]))
          .content(
            APPListFormContent
              .rootPath(myRootPath)));
        
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersIndexView~":DCMSOffersIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath("/offers")
            .mainTitle("Offers")
            .subTitle("Übersicht Offers")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersIndexView~":DCMSOffersIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSOffersIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("CMSOffersIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}