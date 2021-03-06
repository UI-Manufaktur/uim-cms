module uim.cms.views.links.delete_;

@safe:
import uim.cms;
import uim.cms.views.links;

class DCMSLinksDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSLinksDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/links");

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .title(titleDelete("Link löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Links")
          .subTitle("Links löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksDeleteView~"::DCMSLinksDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Link ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Link Name:";

    if (auto myHeader = cast(DPageHeader)this.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Links")
            .item(["active", "fw-bold"], ["href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSLinksDeleteView"));