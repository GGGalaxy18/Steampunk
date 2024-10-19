/// @description pick-up scrap
if point_distance(x, y, obj_player.x, obj_player.y) <= pickup_distance {
	var _scrap_gained = irandom_range(1, 3);
	var _pickup_struct = { num_scrap : _scrap_gained };
	instance_create_depth(x, y, 4, obj_scrap_pickup, _pickup_struct);
	if obj_player.num_scrap == 0 {
		// TODO: show scrap info screen
	}
	obj_player.num_scrap += _scrap_gained;
	instance_destroy();
}
if not audio_is_playing(snd_scrap) audio_play_sound(snd_scrap,10,false);