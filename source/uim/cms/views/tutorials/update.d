module uim.cms.views.tutorials.update;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSTutorialsUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Tutorials")
    );

    this
      .header(
        PageHeader(this).breadcrumbs(bc)// .rootPath(myRootPath).title(titleEdit("Tutorial bearbeiten")).actions(["refresh", "list", "create"]))
      )
      .form(
        Form(this)
          .action(myRootPath~"/actions/save")
          .crudMode(CRUDModes.Update)
          .rootPath(myRootPath)
          .header(
            FormHeader)// .rootPath(myRootPath)// .mainTitle("Tutorials")// .subTitle("Tutorials anzeigen").actions([["cancel2list", "save"], ["edit", "version", "delete"], ["print", "export"]]))
          .content(
            CMSPostFormContent));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsUpdateView~"::DCMSTutorialsUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
/*         .headerTitle(headerTitle)
      .bodyTitle(bodyTitle) */
      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSTutorialsUpdateView"));