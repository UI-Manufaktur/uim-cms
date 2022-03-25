module uim.cms.views.news.delete_;

@safe:
import uim.cms;
import uim.cms.views.news;

class DCMSNewsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSNewsDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "News")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .rootPath(myRootPath)
        .title(titleDelete("News löschen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/delete")
        .rootPath(myRootPath)
        .content(
          CMSPostFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(myRootPath)
          .mainTitle("News")
          .subTitle("News löschen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsDeleteView~"::DCMSNewsDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     auto headerTitle = "News ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "News Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/delete?entity_id="~(entity ? entity.id.toString : null))
/*         .headerTitle(headerTitle)
        .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSNewsDeleteView"));