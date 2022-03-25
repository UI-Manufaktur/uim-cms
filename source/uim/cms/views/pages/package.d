module uim.cms.views.pages;

@safe:
import uim.cms;

// Main
public import uim.cms.views.pages.index;

// CRUD Modules
public import uim.cms.views.pages.create;
public import uim.cms.views.pages.read;
public import uim.cms.views.pages.update;
public import uim.cms.views.pages.delete_;

package:
  string myRootPath = "/cms/pages";