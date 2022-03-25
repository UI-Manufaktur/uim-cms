module uim.cms.views.docus.update;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSDocusUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Docus")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleEdit("Docu bearbeiten"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
      .action("/cms/docus/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath)
      .content(
        CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Docus")
          .subTitle("Docus anzeigen");
      }
    }  
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusUpdateView~"::DCMSDocusUpdateView("~this.name~"):beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Docu ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Docu Name:";

/*     if (auto frm = cast(DForm)this.form) {
      frm
        .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("CMSDocusUpdateView"));