module "shaft" {
  source  = "markti/primitives/minecraft//modules/tube"
  version = "1.0.4"

  start_position = var.start_position
  material       = var.material
  direction      = "up"
  diameter       = var.diameter
  depth          = var.height

}
