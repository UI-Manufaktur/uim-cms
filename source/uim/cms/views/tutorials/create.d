module uim.cms.views.tutorials.create;

@safe:
import uim.cms;
import uim.cms.views.tutorials;

class DCMSTutorialsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSTutorialsCreateView"));

  override void initialize() {
    super.initialize;
    
    this.rootPath("/cms/tutorials");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Tutorials")
      .link(["active"], ["href":this.rootPath~"/create", "aria-current":"page"], "Create")
    );

    if(auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .title(titleCreate("Tutorial erstellen"))
        .rootPath(this.rootPath);
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .content(CMSFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .mainTitle("Neuer Tutorial")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsCreateView~"::DCMSTutorialsCreateView:beforeH5");
    super.beforeH5(options);

    options["rootPath"] = this.rootPath;

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["cms_tutorials"].createFromTemplate);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSTutorialsCreateView"));
