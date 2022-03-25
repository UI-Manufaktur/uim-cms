module uim.cms.views.glossary.delete_;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSGlossaryDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Glossary")
    );

    if (auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
      // .rootPath(myRootPath)
      .title(titleDelete("Glossary löschen"));
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
          .mainTitle("Glossary")
          .subTitle("Glossary löschen"); 
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryDeleteView~"::DCMSGlossaryDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        // headerTitle(headerTitle)
        //.bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSGlossaryDeleteView"));