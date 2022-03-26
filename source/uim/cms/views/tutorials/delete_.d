module uim.cms.views.tutorials.delete_;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSTutorialsDeleteView"));

  override void initialize() {
    super.initialize;

    this.rootPath("/cms/tutorials");

    if (auto header = cast(DPageHeader)this.header) {
      header
        .title(titleDelete("Tutorial löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .content(CMSFormContent)
        .rootPath(this.rootPath);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
        .mainTitle("Tutorials")
        .subTitle("Tutorials löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsDeleteView~"::DCMSTutorialsDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/cms"], "CMS")
            .link(["href":rootPath], "Tutorials")
            .link(["active":"active", "href":rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-")], "Löschen")
          )          
        );
    }
  }
}
mixin(APPViewCalls!("CMSTutorialsDeleteView"));