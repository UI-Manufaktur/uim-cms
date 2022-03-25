module uim.cms.views.glossary;

@safe:
import uim.cms;

// Main
public import uim.cms.views.glossary.index;

// CRUD Modules
public import uim.cms.views.glossary.create;
public import uim.cms.views.glossary.read;
public import uim.cms.views.glossary.update;
public import uim.cms.views.glossary.delete_;

package:
  string myRootPath = "/cms/glossary";
