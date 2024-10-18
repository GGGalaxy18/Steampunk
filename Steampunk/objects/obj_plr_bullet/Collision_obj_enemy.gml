/// @description damage enemy
with (other) {
	scr_enemy_hit_ranged(other.bullet_damage, other.direction, obj_player.ranged_cooldown);
}
instance_destroy();