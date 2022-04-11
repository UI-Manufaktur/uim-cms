module uim.cms.views.links.update;

@safe:
import uim.cms;
import uim.cms.views.links;

class DCMSLinksUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSLinksUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/links");

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleEdit("Link bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/links/actions/save")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .mainTitle("Links")
          .subTitle("Links bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksUpdateView~"::DCMSLinksUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Link ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Link Name:";

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Links")
            .link(["active":"active", "href":rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-")], "Bearbeiten")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSLinksUpdateView"));