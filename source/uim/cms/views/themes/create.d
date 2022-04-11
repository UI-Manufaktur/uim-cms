module uim.cms.views.themes.create;

@safe:
import uim.cms;
import uim.cms.views.themes;

class DCMSThemesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSThemesCreateView"));

  override void initialize() {
    super.initialize;
    
    this.rootPath("/cms/themes");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Themes")
      .link(["active"], ["href":this.rootPath~"/create", "aria-current":"page"], "Create")
    );

    if(auto myHeader = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .title(titleCreate("Theme erstellen"))
        .rootPath(this.rootPath);
    }
    
    if (auto myForm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .content(CMSFormContent(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        frmHeader
          .mainTitle("Neuer Theme")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesCreateView~"::DCMSThemesCreateView:beforeH5");
    super.beforeH5(options);

    options["rootPath"] = this.rootPath;

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["cms_themes"].createFromTemplate);
    }

    if (auto myForm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSThemesCreateView"));
