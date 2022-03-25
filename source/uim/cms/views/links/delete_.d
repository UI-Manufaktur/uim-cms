module uim.cms.views.links.delete_;

@safe:
import uim.cms;
import uim.cms.views.links;

class DCMSLinksDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSLinksDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Links")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleDelete("Link löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
      .action(myRootPath~"/actions/delete")
      .crudMode(CRUDModes.Delete)
      .rootPath(myRootPath)
      .content(
        CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("Links")
          .subTitle("Links löschen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksDeleteView~"::DCMSLinksDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     auto headerTitle = "Link ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Link Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/delete?entity_id="~(entity ? entity.id.toString : null))
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSLinksDeleteView"));