module uim.cms.views.themes;

@safe:
import uim.cms;

// Main
public import uim.cms.views.themes.index;

// CRUD Modules
public import uim.cms.views.themes.create;
public import uim.cms.views.themes.read;
public import uim.cms.views.themes.update;
public import uim.cms.views.themes.delete_;

package:
  string myRootPath = "/cms/themes";