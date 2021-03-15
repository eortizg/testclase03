variable "mandatory_tag_keys" {
  type        = list
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
    "Ambiente",
    "Area",
    "Empresa"
  ]
}

variable "mandatory_tag_values_default" {
  type        = list
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
    "Production",
    "Cumplimiento",
    "Contoso1"
  ]
}


variable "bussiness_units" {
  type        = list
  description = "List of Business units for company"
  default = [
    "Cumplimiento",
    "Compras",
    "UsuariosDeNegocio",
    "Proveedores"
  ]
}


variable "bussiness_units_short" {
  type        = list
  description = "List of Business units short for company"
  default = [
    "cupl",
    "comp",
    "usrn",
    "prov"
  ]
}



