module uim.cms.views.glossary.create;

@safe:
import uim.cms;
import uim.cms.views.glossary;

class DCMSGlossaryCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("CMSGlossaryCreateView"));

  override void initialize() {
    super.initialize;
    
    this.rootPath("/cms/glossary");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/cms"], "CMS")
      .link(["href":this.rootPath], "Glossary")
      .link(["active"], ["href":this.rootPath~"/create", "aria-current":"page"], "Create")
    );

    if(auto header = cast(DPageHeader)this.header) {
      header
        .breadcrumbs(bc)
        .title(titleCreate("Glossary erstellen"))
        .rootPath(this.rootPath);
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .content(CMSFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .mainTitle("Neuer Glossary")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryCreateView~"::DCMSGlossaryCreateView:beforeH5");
    super.beforeH5(options);

    options["rootPath"] = this.rootPath;

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["cms_glossary"].createFromTemplate);
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("CMSGlossaryCreateView"));
