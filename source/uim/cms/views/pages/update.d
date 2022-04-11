module uim.cms.views.pages.update;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSPagesUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/pages");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleEdit("Page bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action("/cms/pages/actions/save")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Pages")
          .subTitle("Pages bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesUpdateView~"::DCMSPagesUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Page ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Page Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Pages")
            .item(["active", "fw-bold"], ["href":rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-")], "Bearbeiten")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSPagesUpdateView"));