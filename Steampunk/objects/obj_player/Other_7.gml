/// @description prevent attack animations from repeating
var _attack_anims = [spr_playerAttackTemp];
if array_contains(_attack_anims, sprite_index) {
	image_speed = 0;
}