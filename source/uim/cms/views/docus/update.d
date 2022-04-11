module uim.cms.views.docus.update;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSDocusUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/cms/docus");

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleEdit("Docu bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/docus/actions/save")
        .crudMode(CRUDModes.Update)
        .content(CMSFormContent(myForm));

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .mainTitle("Docus")
          .subTitle("Docus anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusUpdateView~"::DCMSDocusUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Docu ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Docu Name:";

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":this.rootPath], "Docus")
            .link(["active":"active", "href":rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-")], "Bearbeiten")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSDocusUpdateView"));