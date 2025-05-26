locals {
  meta_subpath = "meta/"
  schema_subpath = "schema/"

  table_meta_path   = "tables/${local.meta_subpath}"
  table_schema_path = "tables/${local.schema_subpath}"
  
  view_meta_path    = "views/${local.meta_subpath}"
  view_schema_path  = "views/${local.schema_subpath}"
}