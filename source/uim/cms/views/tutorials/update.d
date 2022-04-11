module uim.cms.views.tutorials.update;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSTutorialsUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/tutorials");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleEdit("Tutorial bearbeiten"))
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Tutorials")
            .item(["active", "fw-bold"], "Bearbeiten")
          )          
        )
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action("/cms/tutorials/actions/update")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Tutorials")
          .subTitle("Tutorials bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsUpdateView~"::DCMSTutorialsUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";
  }
}
mixin(APPViewCalls!("CMSTutorialsUpdateView"));