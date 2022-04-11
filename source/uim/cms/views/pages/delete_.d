module uim.cms.views.pages.delete_;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSPagesDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/pages");

    if (auto myHeader = cast(DPageHeader)this.header) {
      header
        .title(titleDelete("Page löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        frmHeader
        .mainTitle("Pages")
        .subTitle("Pages löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesDeleteView~"::DCMSPagesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Page ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Page Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Pages")
            .link(["active":"active", "href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSPagesDeleteView"));