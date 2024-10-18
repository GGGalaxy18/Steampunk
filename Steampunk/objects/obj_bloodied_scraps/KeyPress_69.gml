/// @description pick-up scrap
if point_distance(x, y, obj_player.x, obj_player.y) <= pickup_distance {
	scrap_gained = irandom_range(1, 3);
	// TODO: display that n scrap was gained
	// TODO: display info about scrap if it is the player's first time getting it
	obj_player.num_scrap += scrap_gained;
}