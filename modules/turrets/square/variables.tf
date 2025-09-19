variable "material" {
  type        = string
  description = "Block ID for the ring (e.g., 'minecraft:stone')."
}

variable "start_position" {
  description = "CENTER of the circle's start face. North=-Z, South=+Z, East=+X, West=-X."
  type = object({
    x = number
    y = number
    z = number
  })
}

variable "width" {
  type        = number
  description = "Circle diameter in blocks (>= 3, integer)."
  validation {
    condition     = var.diameter >= 3 && floor(var.diameter) == var.diameter
    error_message = "diameter must be an integer >= 3."
  }
}

variable "height" {
  type        = number
  description = "Extrusion length along direction (>= 1, integer)."
  validation {
    condition     = var.height >= 1 && floor(var.height) == var.height
    error_message = "height must be an integer >= 1."
  }
}
