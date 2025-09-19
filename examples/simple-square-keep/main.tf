module "keep" {
  source = "../../modules/keep/square"

  count = 0

  start_position = {
    x = 96
    y = 66
    z = -244
  }
  wall_length    = 24
  wall_height    = 7
  wall_thickness = 2
  wall_material  = "minecraft:stone_bricks"

  turret_diameter = 8
  turret_height   = 12
  turret_material = "minecraft:stone_bricks"

}
