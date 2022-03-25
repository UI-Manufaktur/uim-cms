module uim.cms.views.tutorials;

@safe:
import uim.cms;

// Main
public import uim.cms.views.tutorials.index;

// CRUD Modules
public import uim.cms.views.tutorials.create;
public import uim.cms.views.tutorials.read;
public import uim.cms.views.tutorials.update;
public import uim.cms.views.tutorials.delete_;

package:
  string myRootPath = "/cms/tutorials";