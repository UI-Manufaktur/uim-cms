module uim.cms.views.links;

@safe:
import uim.cms;

// Main
public import uim.cms.views.links.index;

// CRUD Modules
public import uim.cms.views.links.create;
public import uim.cms.views.links.read;
public import uim.cms.views.links.update;
public import uim.cms.views.links.delete_;

package:
  string myRootPath = "/cms/links";