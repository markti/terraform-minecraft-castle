module "keep" {
  source = "../../modules/keep/square"

  count = 1

  start_position = {
    x = 96
    y = 63
    z = -244
  }
  wall_length    = 24
  wall_height    = 7
  wall_thickness = 3
  wall_material  = "minecraft:stone_bricks"

  turret_diameter = 7
  turret_height   = 12
  turret_material = "minecraft:stone_bricks"

}

resource "minecraft_entity" "sheep" {

  count = 0

  type     = "minecraft:sheep"
  position = module.keep[0].courtyard_center
}

module "keep2" {
  source = "../../modules/keep/square"

  count = 1

  start_position = {
    x = 133
    y = 62
    z = -364
  }
  wall_length    = 24
  wall_height    = 18
  wall_thickness = 5
  wall_material  = "minecraft:stone_bricks"

  turret_diameter = 12
  turret_height   = 30
  turret_material = "minecraft:stone_bricks"

}
