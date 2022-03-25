module uim.cms.views.pages.update;

@safe:
import uim.cms;
import uim.cms.views.pages;

class DCMSPagesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("CMSPagesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Seiten")
    );

    this
      .header(
        PageHeader(this)
          .breadcrumbs(bc)
          .rootPath(myRootPath)
          .title(titleEdit("Page bearbeiten"))
          .actions([["refresh", "list", "create"]]))
      .form(
        Form(this)
          .action(myRootPath~"/actions/save")
          .crudMode(CRUDModes.Update)
          .rootPath(myRootPath)
          .header(
            FormHeader
              .rootPath(myRootPath)
              .mainTitle("Pages")
              .subTitle("Pages anzeigen")
              .actions([["cancel2list", "save"], ["edit", "version", "delete"], ["print", "export"]]))
          .content(CMSPostFormContent));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesUpdateView~"::DCMSPagesUpdateView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Page ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Page Name:"; */

    if (auto frm = cast(DForm)this.form) {
      frm
/*         .headerTitle(headerTitle)
        .bodyTitle(bodyTitle) */
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSPagesUpdateView"));