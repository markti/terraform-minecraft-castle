module "wall" {
  source  = "markti/primitives/minecraft//modules/square-frame"
  version = "1.0.4"

  start_position = var.start_position
  material       = var.material
  direction      = var.direction
  width          = var.thickness
  height         = var.height
  depth          = var.length

}
