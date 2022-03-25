module uim.cms.views.news;

@safe:
import uim.cms;

// Main
public import uim.cms.views.news.index;

// CRUD Modules
public import uim.cms.views.news.create;
public import uim.cms.views.news.read;
public import uim.cms.views.news.update;
public import uim.cms.views.news.delete_;

package:
  string myRootPath = "/cms/news";