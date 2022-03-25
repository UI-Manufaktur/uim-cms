module uim.cms.views.blogs;

@safe:
import uim.cms;

// Main
public import uim.cms.views.blogs.index;

// CRUD Modules
public import uim.cms.views.blogs.create;
public import uim.cms.views.blogs.read;
public import uim.cms.views.blogs.update;
public import uim.cms.views.blogs.delete_;

package:
  string myRootPath = "/cms/blogs";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Blogs", "Blogs");
