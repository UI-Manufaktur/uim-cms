module uim.cms.views.offers;

@safe:
import uim.cms;

// Main
public import uim.cms.views.offers.index;

// CRUD Modules
public import uim.cms.views.offers.create;
public import uim.cms.views.offers.read;
public import uim.cms.views.offers.update;
public import uim.cms.views.offers.delete_;

package:
  string myRootPath = "/cms/offers";