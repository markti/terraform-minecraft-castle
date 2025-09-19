resource "minecraft_gamerule" "always_daytime" {
  name  = "doDaylightCycle"
  value = "true"
}
resource "minecraft_gamerule" "allow_mobs" {
  name  = "doMobSpawning"
  value = "false"
}
