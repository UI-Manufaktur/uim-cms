module uim.cms.views.components.navbarslots;

@safe:
import uim.cms;

class DCMSNavSlot : DAPPNavbarSlot {
  mixin(ViewComponentThis!("CMSNavSlot"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    auto rootPath = options.get("rootPath", "/");

    return
      [BS5NavItem(["dropdown"], 
        BS5NavLink(["dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], BS5NavLinkTitle("CMS")),
        BS5DropdownMenu
        .link((options.get("serverCmsOverview", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms"], "Übersicht")
        .divider
        .link((options.get("serverCmsThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/blogs"], "Blogs")
        .link((options.get("serverCmsNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/pages"], "Seiten")
        .link((options.get("serverCmsNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/glossary"], "Glossar")
        .link((options.get("serverCmsNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/links"], "Links")
        .link((options.get("serverCmsNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/offers"], "Angebote")
        .link((options.get("serverCmsPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/news"], "News")
        .link((options.get("serverCmsPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/docus"], "Dokumentationen")
        .link((options.get("serverCmsBlogs", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/themes"], "Themen")
        .link((options.get("serverCmsBlogs", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/cms/tutorials"], "Tutorials")
      )].toH5;
  }
}
mixin(ViewComponentCalls!("CMSNavSlot"));

class DBSIStructure : DAPPNavbarSlot {
  mixin(ViewComponentThis!("BSIStructure"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    auto rootPath = options.get("rootPath", "/");

    return
      [BS5NavItem(["dropdown"], 
        BS5NavLink(["dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], BS5NavLinkTitle("Struktur")),
        BS5DropdownMenu
        .link((options.get("serverCmsOverview", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure"], "Übersicht")
        .divider
        .link((options.get("serverCmsThemes", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/informations"], "Informationen")
        .link((options.get("serverCmsBlogs", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/processes"], "Prozesse")
        .link((options.get("serverCmsNews", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/applications"], "Applikationen")
        .link((options.get("serverCmsPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/itsystems"], "IT-Systeme")
        .link((options.get("serverCmsPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/networks"], "Netzwerke")
        .link((options.get("serverCmsPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/rooms"], "Räume")
        .link((options.get("serverCmsPages", "") == "active" ? ["active"] : [""]), ["href":/* rootPath~ */"/structure/buildings"], "Gebäude")
      )].toH5;
  }
}
mixin(ViewComponentCalls!("BSIStructure"));
