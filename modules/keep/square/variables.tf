variable "start_position" {
  description = "SOUTHWEST outer corner (outside edge) of the keep footprint (ground level)."
  type = object({
    x = number
    y = number
    z = number
  })
}

# ---- Walls ------------------------------------------------------------------

variable "wall_length" {
  description = "Straight run length *between turret exteriors* (tangent-to-tangent) for each side."
  type        = number
}

variable "wall_height" {
  description = "Vertical height of the connecting walls (in blocks)."
  type        = number
  default     = 7
}

variable "wall_thickness" {
  description = "Wall thickness (blocks along the perpendicular horizontal axis)."
  type        = number
  default     = 2
}

variable "wall_material" {
  description = "Block ID for walls (e.g., 'minecraft:stone_bricks')."
  type        = string
  default     = "minecraft:stone_bricks"
}

# ---- Turrets ----------------------------------------------------------------

variable "turret_diameter" {
  description = "Outer diameter of each round turret (in blocks; integer >= 3)."
  type        = number
}

variable "turret_height" {
  description = "How tall each turret rises (in blocks; integer >= 1)."
  type        = number
  default     = 11
}

variable "turret_material" {
  description = "Block ID for turrets (e.g., 'minecraft:stone_bricks')."
  type        = string
  default     = "minecraft:stone_bricks"
}
