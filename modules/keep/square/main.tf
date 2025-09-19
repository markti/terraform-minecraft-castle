terraform {
  required_version = ">= 1.6.0"
}

locals {
  # radius from diameter
  r = floor(var.turret_diameter / 2)

  # Minecraft axes reminder:
  #  X: east (+), west (-)
  #  Z: south (+), north (-)
  #
  # We treat start_position as the SOUTHWEST *outer corner* (ground level).
  # Turret module expects CENTER of the start face (we're building up).

  # ---- Turret centers -------------------------------------------------------
  # Southwest turret center is inset by r east (+X) and r north (-Z)
  sw_center = {
    x = var.start_position.x + local.r
    y = var.start_position.y
    z = var.start_position.z - local.r
  }

  # East/West center spacing must be wall_length + 2r (tangent-to-tangent walls)
  se_center = {
    x = local.sw_center.x + var.wall_length + (2 * local.r)
    y = var.start_position.y
    z = local.sw_center.z
  }

  # North/South center spacing must be wall_length + 2r
  nw_center = {
    x = local.sw_center.x
    y = var.start_position.y
    z = local.sw_center.z - (var.wall_length + (2 * local.r))
  }

  ne_center = {
    x = local.se_center.x
    y = var.start_position.y
    z = local.nw_center.z
  }

  # ---- Wall starts (centered on turret tangents) ----------------------------
  # South wall runs EAST (+X); right is +Z → center on Z = sw_center.z
  south_wall_start = {
    x = local.sw_center.x + local.r
    y = var.start_position.y
    z = local.sw_center.z - floor((var.wall_thickness - 1) / 2)
  }

  # North wall runs EAST (+X); right is +Z → center on Z = nw_center.z
  north_wall_start = {
    x = local.nw_center.x + local.r
    y = var.start_position.y
    z = local.nw_center.z - floor((var.wall_thickness - 1) / 2)
  }

  # West wall runs NORTH (-Z); right is +X → center on X = sw_center.x
  west_wall_start = {
    x = local.sw_center.x - floor((var.wall_thickness - 1) / 2)
    y = var.start_position.y
    z = local.sw_center.z - local.r
  }

  # East wall runs NORTH (-Z); right is +X → center on X = se_center.x
  east_wall_start = {
    x = local.se_center.x - floor((var.wall_thickness - 1) / 2)
    y = var.start_position.y
    z = local.se_center.z - local.r
  }
}

# ================= Turrets (round, always UP) ===============================

module "turret_sw" {
  source         = "../../turrets/round"
  material       = var.turret_material
  start_position = local.sw_center
  diameter       = var.turret_diameter # your round module uses 'width' for diameter
  height         = var.turret_height   # extrudes UP by height
}

module "turret_se" {
  source         = "../../turrets/round"
  material       = var.turret_material
  start_position = local.se_center
  diameter       = var.turret_diameter
  height         = var.turret_height
}

module "turret_nw" {
  source         = "../../turrets/round"
  material       = var.turret_material
  start_position = local.nw_center
  diameter       = var.turret_diameter
  height         = var.turret_height
}

module "turret_ne" {
  source         = "../../turrets/round"
  material       = var.turret_material
  start_position = local.ne_center
  diameter       = var.turret_diameter
  height         = var.turret_height
}

# ================= Walls (flat) =============================================

# South wall: runs EAST (+X)
module "wall_south" {
  source         = "../../walls/flat"
  material       = var.wall_material
  start_position = local.south_wall_start
  length         = var.wall_length    # along direction
  thickness      = var.wall_thickness # perpendicular thickness
  height         = var.wall_height    # vertical blocks
  direction      = "east"
}

# North wall: runs EAST (+X)
module "wall_north" {
  source         = "../../walls/flat"
  material       = var.wall_material
  start_position = local.north_wall_start
  length         = var.wall_length
  thickness      = var.wall_thickness
  height         = var.wall_height
  direction      = "east"
}

# West wall: runs NORTH (-Z)
module "wall_west" {
  source         = "../../walls/flat"
  material       = var.wall_material
  start_position = local.west_wall_start
  length         = var.wall_length
  thickness      = var.wall_thickness
  height         = var.wall_height
  direction      = "north"
}

# East wall: runs NORTH (-Z)
module "wall_east" {
  source         = "../../walls/flat"
  material       = var.wall_material
  start_position = local.east_wall_start
  length         = var.wall_length
  thickness      = var.wall_thickness
  height         = var.wall_height
  direction      = "north"
}
