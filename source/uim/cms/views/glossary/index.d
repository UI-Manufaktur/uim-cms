module uim.cms.views.glossary.index;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryIndexView : DAPPEntitiesListView {
  mixin(APPViewThis!("CMSGlossaryIndexView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Glossary")
    );

    auto headerTitle = titleList("Glossary");
    auto bodyTitle = "Gefundene Glossary";

    this
      .header(
        PageHeader(this).breadcrumbs(bc)// .rootPath(myRootPath).title(titleView("Übersicht Glossary")).actions(["refresh", "list", "create"]))
      )
      .form(
        APPEntitiesListForm(this)
          .rootPath(myRootPath)
          .header(
            FormHeader
              .rootPath(myRootPath)
              .mainTitle("Glossary")
              .subTitle("Glossary anzeigen")
              .actions([["print", "export"]]))
          .content(
            APPListFormContent
              .rootPath(myRootPath)));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryIndexView~":DCMSGlossaryIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .rootPath("/glossary")
            .mainTitle("Glossary")
            .subTitle("Übersicht Glossary")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryIndexView~":DCMSGlossaryIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSGlossaryIndexView:toH5 -> ", this.rootPath);
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
mixin(APPViewCalls!("CMSGlossaryIndexView"));

version(test_uim_cms) {
  unittest {
    // TODO
}}