module uim.cms.views.pages.delete_;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("CMSPagesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":myRootPath], "Pages")
    );

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(myRootPath)
          .title(titleDelete("Page löschen"))
          .actions([["refresh", "list", "create"]]))
      .form(
        Form(this)
          .action(myRootPath~"/actions/delete")
          .crudMode(CRUDModes.Delete)
          .rootPath(myRootPath)
          .header(
            FormHeader
            .rootPath(myRootPath)
            .mainTitle("Pages")
            .subTitle("Pages löschen")
            .actions([["cancel2root", "finalDelete"], ["view", "version", "edit"], ["print", "export"]]))
          .content(
            CMSPostFormContent));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesDeleteView~"::DCMSPagesDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     auto headerTitle = "Page ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Page Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(myRootPath~"/actions/delete?entity_id="~(entity ? entity.id.toString : null))
/*         .headerTitle(headerTitle)
        .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSPagesDeleteView"));