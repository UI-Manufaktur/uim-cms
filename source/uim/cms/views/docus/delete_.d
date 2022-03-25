module uim.cms.views.docus.delete_;

@safe:
import uim.cms;
import uim.cms.views.docus;

class DCMSDocusDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSDocusDeleteView"));

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
        .title(titleDelete("Docu löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/docus/actions/delete")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Docus")
          .subTitle("Docus löschen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusDeleteView~"::DCMSDocusDeleteView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Docu ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Docu Name:";
 */
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/cms/docus/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity); 
    }
  }
}
mixin(APPViewCalls!("CMSDocusDeleteView"));