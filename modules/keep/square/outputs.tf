output "turret_centers" {
  description = "Computed center positions for the four turrets (for add-ons like gates or battlements)."
  value = {
    sw = local.sw_center
    se = local.se_center
    nw = local.nw_center
    ne = local.ne_center
  }
}

output "footprint_outer_corners" {
  description = "Convenience: outer footprint corners based on start_position and dimensions."
  value = {
    # Outer side length = wall_length + 2 * diameter
    side = var.wall_length + (2 * var.turret_diameter)

    # Southwest is the provided start_position (outer edge)
    sw = var.start_position

    # Southeast corner (outer edge)
    se = {
      x = var.start_position.x + var.wall_length + (2 * local.r) + (2 * local.r) - 2 * local.r
      y = var.start_position.y
      z = var.start_position.z
    }

    # For clarity, compute exact outer corners explicitly:
    # Outer west edge x = start_x
    # Outer east edge x = start_x + (wall_length + 2*diameter)
    # Outer south edge z = start_z
    # Outer north edge z = start_z - (wall_length + 2*diameter)
    exact = {
      west_x  = var.start_position.x
      east_x  = var.start_position.x + var.wall_length + (2 * var.turret_diameter)
      south_z = var.start_position.z
      north_z = var.start_position.z - var.wall_length - (2 * var.turret_diameter)
    }
  }
}
